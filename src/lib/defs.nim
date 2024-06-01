import ../wrapper/igraph_wrapper


let
  success* = Igraphsuccess

  directed*   = Igraphdirected
  undirected* = Igraphundirected

  # enumigraphloopst
  noLoops*   = Igraphnoloops
  loops*     = Igraphloops
  loopsOnce* = Igraphloopsonce



converter toOther*(data:seq[int]):igraph_vector_int_t =
  var tmp:igraph_vector_int_t
  var ret = igraph_vector_int_view(tmp.addr, 
                         cast[ptr igraphintegert](data[0].addr), 
                         data.len.igraphintegert)
  # if ret != Igraphsuccess:
  #   raise newException(ValueError, "failed" ) # igrapherrort  
  return tmp

converter toIgraphInt*(val:int):igraphintegert =
  val.igraphintegert

converter toIgraphBool*(val:bool):igraphboolt =
  val.igraphboolt

converter toIgraphBool*(val:enumigraphidirectedt):igraphboolt =
  val.igraphboolt

# converter toPointerInt*(val:int):ptr igraphintegert =
#   (val.igraphintegert).addr