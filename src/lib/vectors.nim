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