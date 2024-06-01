import ../wrapper/igraph_wrapper
import defs

type
  GraphObj* = object 
    handle*:igrapht
  Graph* = ref GraphObj
  #DirectedType = enumigraphidirectedt

# ---------------------------------------
# 4.1. Graph constructors and destructors
# ---------------------------------------
# https://igraph.org/c/html/latest/igraph-Basic.html#graph-constructors-and-destructors


# 4.1.4. igraph_destroy — Frees the memory allocated for a graph object.
proc `=destroy`*(g:GraphObj) =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_destroy
  igraph_destroy(g.handle.addr)

# 4.1.3. igraph_copy — Creates an exact (deep) copy of a graph.
proc `=copy`*(dest: var GraphObj; source: GraphObj) =
  # https://igraph.org/c/html/0.9.4/igraph-Basic.html#igraph_copy
  # int igraph_copy(igraph_t *to, const igraph_t *from);
  
  # protect against self-assignments:
  if dest.handle != source.handle:
    `=destroy`(dest)
    wasMoved(dest)
    var ret = igraph_copy(dest.handle.addr, source.handle.addr)
    if ret != success:
      raise newException(ValueError, "error")
    #dest.field = duplicateResource(source.field)

# 4.1.1. igraph_empty — Creates an empty graph with some vertices and no edges.
proc newGraph*(nVertices:int; directed:enumigraphidirectedt):Graph =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_empty
  result = new Graph  
  var ret = igraph_empty(result.handle.addr, nVertices, directed.igraphboolt)
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort  

# TODO: 4.1.2. igraph_empty_attrs — Creates an empty graph with some vertices, no edges and some graph attributes.
# https://igraph.org/c/html/0.9.4/igraph-Basic.html#igraph_empty_attrs


