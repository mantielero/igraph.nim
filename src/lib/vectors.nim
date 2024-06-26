import ../wrapper/igraph_wrapper
import defs
# https://igraph.org/c/doc/igraph-Data-structures.html#igraph-Vectors

type
  VectorIntObj* = object
    handle*:igraph_vector_int_t

  VectorInt* = ref VectorIntObj

#v = cast[ptr UncheckedArray[int]](vit.handle.vec.stor_begin)

# 2.2.5. igraph_vector_destroy — Destroys a vector object.
proc `=destroy`*(val:VectorIntObj) =
  # https://igraph.org/c/doc/igraph-Data-structures.html#igraph_vector_destroy
  igraph_vector_int_destroy( val.handle.addr )

# 2.2.1. igraph_vector_init — Initializes a vector object (constructor).
proc newVectorInt*(size:int = 0):VectorInt =
  result = new VectorInt
  var res = igraph_vector_int_init(result.handle.addr, size)
  if res != SUCCESS:
    raise newException(ValueError, "error")

proc capacity*(v:VectorInt):int =
  igraph_vector_int_capacity(v.handle.addr).int

proc max*(data:VectorInt):int = 
  igraph_vector_int_max(data.handle.addr).int

proc whichMax*(data:VectorInt):int = 
  igraph_vector_int_which_max(data.handle.addr).int

proc sort*(v:VectorInt) =
  igraph_vector_int_sort(v.handle.addr)

proc print*(v:VectorInt) =
  var res = igraph_vector_int_print(v.handle.addr)
  if res != SUCCESS:
    raise newException(ValueError, "error")

proc get*(v:VectorInt; n:int):int =
  igraphvectorintget(v.handle.addr, n).int

proc sum*(v:VectorInt):int =
  igraph_vector_int_sum(v.handle.addr).int


proc `[]`*(v:VectorInt; n:int):int =
  cast[ptr UncheckedArray[int]](v.handle.stor_begin)[n]

proc `[]=`*(v:VectorInt; n,m:int) =
  cast[ptr UncheckedArray[int]](v.handle.stor_begin)[n] = m

proc vssVector*(v:VectorInt):igraphvst =
  igraphvssvector(v.handle.addr)