import ../wrapper/igraph_wrapper
import basic_interface, defs

# =========
# Iterators
# =========
# https://igraph.org/c/html/latest/igraph-Iterators.html

# --------------------------
# About selectors, iterators
# --------------------------
# https://igraph.org/c/html/latest/igraph-Iterators.html#about-iterators


# ----------------------------
# Vertex selector constructors
# ----------------------------
# https://igraph.org/c/html/latest/igraph-Iterators.html#vertex-selector-constructors



type
  VertexSelectorObj* = object
    handle*:igraph_vs_t
  VertexSelector* = ref VertexSelectorObj

proc `=destroy`*(vs:VertexSelectorObj) =
  igraph_vs_destroy(vs.handle.addr)

# 2.1. igraph_vs_all — Vertex set, all vertices of a graph.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_all
proc vsAll*():VertexSelector =
  result = new VertexSelector
  var ret = igraph_vs_all(result.handle.addr)
  if ret != success:
    raise newException(ValueError, "error")



# 2.2. igraph_vs_adj — Adjacent vertices of a vertex.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_adj

# 2.3. igraph_vs_nonadj — Non-adjacent vertices of a vertex.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_nonadj
# IGRAPH_OUT, IGRAPH_IN, IGRAPH_ALL 
proc vsNonAdj*(vid:int; mode:igraph_neimode_t ):VertexSelector =
  result = new VertexSelector  
  var ret = igraph_error_t igraph_vs_nonadj(result.handle.addr, vid,
                    mode);


# 2.4. igraph_vs_none — Empty vertex set.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_none

# 2.5. igraph_vs_1 — Vertex set with a single vertex.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_1

# 2.6. igraph_vs_vector — Vertex set based on a vector.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_vector

# 2.7. igraph_vs_vector_small — Create a vertex set by giving its elements.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_vector_small

# 2.8. igraph_vs_vector_copy — Vertex set based on a vector, with copying.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_vector_copy

# 2.9. igraph_vs_range — Vertex set, an interval of vertices.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_range


# ----------------
# 5. Vertex iterators
# ----------------
# https://igraph.org/c/html/latest/igraph-Iterators.html#vertex-iterators

type
  VertexIteratorObj* = object
    handle*: igraph_vit_t
  VertexIterator* = ref VertexIteratorObj

proc `=destroy`*(vit:VertexIteratorObj) =
  # https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vit_destroy
  igraph_vit_destroy(vit.handle.addr)


# 5.1. igraph_vit_create — Creates a vertex iterator from a vertex selector.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vit_create
proc newVertexIterator*(g:Graph; vs:VertexSelector):VertexIterator =
  result = new VertexIterator
  var ret = igraph_vit_create(g.handle.addr, vs.handle, result.handle.addr)
  if ret != success:
    raise newException(ValueError, "error")


# https://igraph.org/c/html/latest/igraph-Iterators.html#stepping-over-vertices

# https://igraph.org/c/html/latest/igraph-Iterators.html#IGRAPH_VIT_NEXT
# #define IGRAPH_VIT_NEXT(vit)  (++((vit).pos))
proc next*(vit:VertexIterator) =
  vit.handle.pos += 1

# https://igraph.org/c/html/latest/igraph-Iterators.html#IGRAPH_VIT_END
# #define IGRAPH_VIT_END(vit)   ((vit).pos >= (vit).end)
proc isEnd*(vit:VertexIterator):bool =
  return vit.handle.pos >= vit.handle.endfield

# https://igraph.org/c/html/latest/igraph-Iterators.html#IGRAPH_VIT_SIZE

# https://igraph.org/c/html/latest/igraph-Iterators.html#IGRAPH_VIT_RESET

# https://igraph.org/c/html/latest/igraph-Iterators.html#IGRAPH_VIT_GET
# #define IGRAPH_VIT_GET(vit)  \
#     ((igraph_integer_t)(((vit).type == IGRAPH_VIT_RANGE) ? (vit).pos : \
#                         VECTOR(*(vit).vec)[(vit).pos]))
proc get*(vit:VertexIterator):int =
  if vit.handle.typefield == IGRAPH_VIT_RANGE:
    return vit.handle.pos
  else:
    # igraph_vector_pmt.h:#define VECTOR(v) ((v).stor_begin)
    var v = cast[ptr UncheckedArray[int]](vit.handle.vec.stor_begin)
    return v[vit.handle.pos]
    #var vec = vit.vec # ptr igraphvectorintt

    #VECTOR(*(vit).vec)[(vit).pos]))

iterator items*(g:Graph; vs:VertexSelector):int =
  var vit = newVertexIterator(g,vs)
  #echo vit.isEnd
  while not vit.isEnd:
      yield vit.get
      vit.next  

# -----------
# 
# ------------



# 3.4. igraph_vs_size — Returns the size of the vertex selector.
# https://igraph.org/c/html/latest/igraph-Iterators.html#igraph_vs_size
proc size*(g:Graph; vs:VertexSelector):int =
  var tmp:igraph_integer_t
  var ret = igraph_vs_size(g.handle.addr, vs.handle.addr,
                   tmp.addr)
  if ret != success:
    raise newException(ValueError, "error")                   
  return tmp.int