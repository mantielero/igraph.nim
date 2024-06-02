import ../wrapper/igraph_wrapper


const
  SUCCESS* = Igraphsuccess


const
  # enumigraphloopst
  NOLOOPS*   = Igraphnoloops
  LOOPS*     = Igraphloops
  LOOPSONCE* = Igraphloopsonce

const
  DIRECTED*   = Igraphdirected
  UNDIRECTED* = Igraphundirected

converter toVectorViewInt*(data:seq[int]):igraph_vector_int_t =
  var tmp:igraph_vector_int_t
  #igraph_vector_int_init(tmp.addr, data.len)
  if data.len > 0:
    var ret = igraph_vector_int_view(tmp.addr, 
                          cast[ptr igraphintegert](data[0].addr), 
                          data.len.igraphintegert)
    # echo "STOREBEGIN: ", ret.storbegin[]
    # echo "STOREEND: ", ret.storend[]
    # echo "ENDFIELD: ", ret.endfield[]    
    #if ret != SUCCESS:
    #  raise newException(ValueError, "failed" ) # igrapherrort  
  return tmp

converter toIgraphInt*(val:int):igraphintegert =
  val.igraphintegert

converter toIgraphBool*(val:bool):igraphboolt =
  val.igraphboolt

converter toIgraphBool*(val:enumigraphidirectedt):igraphboolt =
  val.igraphboolt

# converter toPointerInt*(val:int):ptr igraphintegert =
#   (val.igraphintegert).addr


# Sequence to structigraphvectorintt
# converter toIgraphVectorInt*(vec:seq[int]):igraphvectorintt =
#   result = new igraphvectorintt
#   if vec.len > 0:
#     result.storebegin = cast[ptr igraphintegert](vec[0].addr)



#[
    storbegin*: ptr igraphintegert ## Generated based on /usr/include/igraph/igraph_vector_type.h:29:16
    storend*: ptr igraphintegert
    endfield*: ptr igraphintegert
]#
