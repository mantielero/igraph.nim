import ../wrapper/igraph_wrapper
import graph

#----
type
  # VectorIntObj* = object
  #   handle*:igraphvectorintt
  # VectorInt* = ref VectorIntObj

  VectorRealObj* = object
    handle*:igraphvectort
  VectorReal* = ref VectorRealObj

# proc `=destroy`*(v:VectorIntObj) =
#   igraph_vector_int_destroy(v.handle.addr)

proc `=destroy`*(v:VectorRealObj) =
  igraph_vector_destroy(v.handle.addr)





# https://igraph.org/c/doc/igraph-Data-structures.html
# Data Structures
#[
  igraph_vector_int_init(&result, 0);
  igraph_vector_init(&result_real, 0);
]#



# proc newVectorInt*(size:int = 0):VectorInt =
#   # https://igraph.org/c/doc/igraph-Data-structures.html#igraph_vector_init
#   result = new VectorInt
#   var ret = igraph_vector_int_init(result.handle.addr, size.igraph_integer_t)  
#   if ret != Igraphsuccess:
#     raise newException(ValueError, "failed" ) # igrapherrort   

proc newVectorReal*(size:int = 0):VectorReal =
  result = new VectorReal
  # https://igraph.org/c/doc/igraph-Data-structures.html#igraph_vector_init
  var ret = igraph_vector_init(result.handle.addr, size.igraph_integer_t)  
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   


# -----
proc closeness*(g:Graph):VectorReal =
  var tmp = newVectorReal()
  var ret = igraph_closeness(g.handle.addr, tmp.handle.addr, 
                   nil, nil, igraph_vss_all(), 
                   IGRAPH_ALL,
                   nil,   # weights=
                   false) # normalized=
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort                 
  return tmp      

proc max*(data:VectorReal):float = 
  igraph_vector_max(data.handle.addr).float

proc whichMax*(data:VectorReal):float = 
  igraph_vector_which_max(data.handle.addr).float


proc betweenness*(g:Graph):VectorReal =
  var tmp = newVectorReal()  
  var ret = igraph_betweenness(g.handle.addr, tmp.handle.addr, 
                     igraph_vss_all(),
                     IGRAPH_UNDIRECTED.igraphboolt, 
                     nil) # weights=
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort                 
  return tmp     