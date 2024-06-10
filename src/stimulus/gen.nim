#  nim c -r --deepcopy:on gen > borrame.nim
import yaml,streams
import yaml/data, yaml/parser, yaml/hints
import std/[strformat,strutils]

proc deepCopy[T](dst: var ref T; src: ref T) =
  if unlikely(src == nil):
    dst = nil
  else:
    if dst == nil:
      dst.new()
    deepCopy(dst[], src[])

type
  ParamObj = object
    primary:string
    inout:string
    typ:string
    id:string
    default:string
  Param = ref ParamObj

  FunctionObj = object
    name:string
    params:seq[Param] = @[]
    deps:seq[string] = @[]
    returns:string
    internal:bool

  Function = ref FunctionObj

proc `$`(p:Param):string =
  result = "PARAM:\n"
  result &= &"  PRIMARY: {p.primary}\n"
  result &= &"  INOUT:   {p.inout}\n"
  result &= &"  TYP:     {p.typ}\n"
  result &= &"  ID:      {p.id}\n"
  result &= &"  DEFAULT: {p.default}\n"


proc `$`*(f:Function):string =
  result = &"FUNCTION NAME: {f.name}\n"
  if f.params != @[]:
    result &= &"   PARAMS:\n"
    for p in f.params:
      result &= &"     [{p.primary}, {p.inout}, {p.typ}, {p.id}, {p.default}]\n"
  if f.deps != @[]:
    result &= &"   DEPS: {f.deps}\n"
  if f.returns != "":
    result &= &"   RETURN: {f.returns}\n"
  if f.internal == true:
    result &= &"   INTERNAL: true\n"    


iterator getFunctions(events:YamlStream):Function =
  var level = 0
  var paramName = true
  var item:Function
  var subItemName:string
  for ev in events.items():
    #echo level, "  ", ev.kind
    if ev.kind == yamlStartMap:
      level += 1
      continue
    elif ev.kind == yamlEndMap:
      level -= 1
      if level == 1:
        yield item
      continue
    elif ev.kind == yamlScalar:
      #echo ev.scalarProperties.anchor
      #echo ev.scalarProperties.tag
      #echo ev.scalarStyle
      #echo ev.scalarContent
      if level == 1:
        #echo "Function name: ", ev.scalarContent
        item = new Function
        item.name = ev.scalarContent
      elif level == 2:
        if paramName:
          paramName = false
          subItemName = ev.scalarContent
        else:
          if subItemName == "PARAMS":
            var tmp = ev.scalarContent.replace("\n", "").split(",")
            #var params:seq[Param]
            for i in 0..tmp.high:
              tmp[i] = tmp[i].strip()
              var tmp2 = tmp[i].split()
              var param = new Param
              if tmp2[tmp2.high].contains("="):
                var tmp3 = tmp2[tmp2.high].split("=")
                param.id = tmp3[0]
                param.default = tmp3[1]
              else:
                param.id = tmp2[tmp2.high]
              param.typ = tmp2[tmp2.high - 1]

              if tmp2.len > 2:
                var tmp3 = tmp2[tmp2.high - 2]
                if tmp3 in @["IN", "OUT", "INOUT"]:
                  param.inout = tmp3
                else:
                  param.primary = tmp3
              if tmp2.len > 3:
                param.primary = tmp2[0]
              item.params &= param

            # https://github.com/igraph/stimulus/blob/main/docs/index.mdx#params
            # PARAMS: [PRIMARY] [IN/OUT] <TYPE> identifier=DEFAULT
            # OPTIONAL OUT VECTOR_INT idx
            # = params
          elif subItemName == "DEPS":
            var tmp = ev.scalarContent.replace("\n", "")
            item.deps = tmp.split(",")
          elif subItemName == "RETURN":
            item.returns = ev.scalarContent
          elif subItemName == "INTERNAL":
            item.internal = false
            if ev.scalarContent == "true":
              item.internal = true
          paramName = true                

proc toNimType(val:string):string =
  case val
  #of "GRAPH": "Graph"
  of "REAL": "float"
  of "INTEGER": "int"
  of "BOOLEAN": "bool"
  of "DOUBLE": "float"
  of "CSTRING": "cstring"
  of "INT": "cint"
  #of ""
  else: val.toLowerAscii.capitalizeAscii() 

proc toReturnType(val:string):string =
  case val
  of "CSTRING": "string"
  of "INT": "int"
  of "GRAPH": "Graph"
  else: "NOT__MANAGED" #val.toLowerAscii.capitalizeAscii()   



proc addFunction(f:Function; inout:string = "IN"):string =
  var lib = ""
  # Get Nim's function name

  var fName = f.name.split("igraph_",1)[1]

  if fName.contains("_"):
    var tmp = fName.split("_")
    for i in 1..tmp.high:
      tmp[i] = tmp[i].capitalizeAscii()
    fName = tmp.join()
  
  # Return not empty
  var returnNimString = ""
  if f.returns in @["REAL", "BOOLEAN", "INTEGER", "CSTRING", "VOID"]:    
    # Return
    returnNimString = case f.returns:
                            of "REAL": 
                              "float"
                            of "BOOLEAN": 
                              "bool"
                            of "INTERGER": 
                              "int"
                            of "CSTRING": 
                              "string"
                            else:
                              ""
    
  # Get params
  var paramNimString = ""
  var paramString = ""
  var returnTuple = newSeq[string]()
  var returnTupleType = newSeq[tuple[name,typ:string]]()
  var preCall = ""
  for p in f.params:
    # for INPUT parameters
    if p.inout in @["IN", ""]:
      if paramNimString != "":
        paramNimString &= "; "
      if paramString != "":  
        paramString &= ", "

      paramNimString &= &"{p.id}:{p.typ.toNimType}"
      if p.typ == "GRAPH":
        paramString &= &"{p.id}.handle.addr"
      else:
        paramString &= p.id
    
    # for output parameters
    elif p.inout == "OUT":
      if p.typ == "GRAPH":
        paramString &= &"result.handle.addr"
        preCall = "  result = new Graph"
      else:
        preCall &= &"  var {p.id}:{p.typ.toNimType}\n"
        if paramString != "":
          paramString &= ", "
        paramString &= &"{p.id}.addr"
        if p.typ == "CSTRING":
          returnTuple &= &"${p.id}"
        else:  
          returnTuple &= &"{p.id}.{p.typ.toReturnType}"
      returnTupleType &= (p.id, p.typ.toReturnType) #&"{p.id}:{p.typ.toReturnType}"

  #echo paramString
  if returnNimString != "":
    lib &= &"proc {fName}*({paramNimString}):{returnNimString} =\n"
  else:
    if returnTupleType != @[]:
      var retTyp = ""
      if returnTupleType.len == 1:
        retTyp = returnTupleType[0].typ
      else:
        retTyp = "tuple["
        for item in returnTupleType:
          if retTyp != "tuple[":
            retTyp &= "; "
          retTyp &= &"{item.name}:{item.typ}"
        retTyp &= "]"

      lib &= &"proc {fName}*({paramNimString}):{retTyp} =\n"  
    else:
      lib &= &"proc {fName}*({paramNimString}) =\n"

  # Whatever is needed before calling the function
  if preCall != "":
    lib &= &"{preCall}\n"

  
  var functionCall = &"{f.name}({paramString})"
  if returnNimString != "":
    lib &= &"  return ( {functionCall} ).{returnNimString}\n"
  else:
    lib &= &"  var ret = {functionCall}\n"
    lib &= "  if ret != Igraphsuccess:\n"
    lib &= """    raise newException(ValueError, &"error while calling the function: {ret}")"""
    var retVal = "("
    for ret in returnTuple:
      if retVal != "(":
        retVal &= ", "
      retVal &= ret
    retVal &= ")"
    if returnTuple.len > 0:
      lib &= &"  return {retVal}"
  lib &= "\n\n"
  return lib


proc main =
  #var strm = newFileStream("prueba.yaml", fmRead)
  var strm = newFileStream("functions.yaml", fmRead)

  var 
    yamlParser = initYamlParser()
    events = yamlParser.parse(strm)
  var lib = "import ../wrapper/igraph_wrapper\nimport std/strformat\n\n"
  lib &= """
type
  GraphObj* = object 
    handle*:igrapht
  Graph* = ref GraphObj


"""
  for f in events.getFunctions():
    var f2,f3:Function 
    f2.deepCopy(f)#new Function
    f3.deepCopy(f)
    var flag = true
    for i in 0..f.params.high:
      if f.params[i].inout == "INOUT":
        flag = false
        f2.params[i].inout = "OUT"
        f3.params[i].inout = "IN"

    if flag:
      lib &= addFunction(f)
    else:
      lib &= addFunction(f2)
      lib &= addFunction(f3)

  echo lib

  strm.close()


main()