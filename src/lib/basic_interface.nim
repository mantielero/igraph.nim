import ../wrapper/igraph_wrapper
import defs, graph, data_structures
# ===============
# Basic Interface
# ===============
# https://igraph.org/c/html/latest/igraph-Basic.html#basic-interface

# see graph.nim

# ---------------------------
# 4.2. Basic query operations
# ---------------------------
# https://igraph.org/c/html/latest/igraph-Basic.html#basic-query-operations

# 4.2.1. igraph_vcount — The number of vertices in a graph.
proc vCount*(g:Graph):int =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount
  (igraph_vcount(g.handle.addr)).int

# 4.2.2. igraph_ecount — The number of edges in a graph.
proc eCount*(g:Graph):int =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_ecount
  (igraph_ecount(g.handle.addr)).int

# 4.2.3. igraph_edge — Gives the head and tail vertices of an edge.
proc edge*(g:Graph; edgeId:int):tuple[a,b:int] =
  ## returns the head and tail vertices of an edge.
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edge
  var a,b:igraphintegert
  var ret = igraph_edge( g.handle.addr, edgeId, 
              a.addr, 
              b.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort 
  return (a.int, b.int)

# 4.2.4. igraph_edges — Gives the head and tail vertices of a series of edges.
# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges
# igraph_error_t igraph_edges(const igraph_t *graph, igraph_es_t eids, igraph_vector_int_t *edges);

# 4.2.5. IGRAPH_FROM — The source vertex of an edge.
#[
igraph_interface.h:
  #define IGRAPH_FROM(graph,eid) ((igraph_integer_t)(VECTOR((graph)->from)[(igraph_integer_t)(eid)]))
]#
proc `from`*(g:Graph; eid:int):int =  # maybe better to call "source"
  # TODO: https://igraph.org/c/html/latest/igraph-Basic.html#IGRAPH_FROM
  # #define VECTOR(v) ((v).stor_begin)
  #((igraph_integer_t)(VECTOR((graph)->from)[(igraph_integer_t)(eid)]))
  var v = cast[ptr UncheckedArray[int]](g.handle.fromfield.stor_begin)
  return v[eid]


# 4.2.6. IGRAPH_TO — The target vertex of an edge.
proc to*(g:Graph; eid:int):int =  # maybe better to call "source"
  # TODO: https://igraph.org/c/html/latest/igraph-Basic.html#IGRAPH_TO
  # #define VECTOR(v) ((v).stor_begin)
  # igraph_interface.h:#define IGRAPH_TO(graph,eid)   ((igraph_integer_t)(VECTOR((graph)->to)  [(igraph_integer_t)(eid)]))
  var v = cast[ptr UncheckedArray[int]](g.handle.to.stor_begin)
  return v[eid]

# 4.2.7. IGRAPH_OTHER — The other endpoint of an edge.
#[
#define IGRAPH_OTHER(graph,eid,vid) \
    ((igraph_integer_t)(IGRAPH_TO(graph,(eid))==(vid) ? IGRAPH_FROM((graph),(eid)) : IGRAPH_TO((graph),(eid))))
]#
proc other*(g:Graph; eid,vid:int):int =
  # TODO: https://igraph.org/c/html/latest/igraph-Basic.html#IGRAPH_OTHER
  if g.to(eid) == vid: # if `vid` is destination
    return g.`from`(eid)
  return g.to(eid)


# 4.2.8. igraph_get_eid — Get the edge id from the end points of an edge.
proc getEid*(g:Graph;source,dest:int; directed:bool):int =
# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_get_eid
  var eid:igraph_integer_t
  var error:igraph_bool_t
  var ret = igraph_get_eid(g.handle.addr, eid.addr,
                           source, dest,
                           directed, error)

  return eid.int


# 4.2.9. igraph_get_eids — Return edge ids based on the adjacent vertices.

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_get_eids
#[
igraph_error_t igraph_get_eids(const igraph_t *graph, igraph_vector_int_t *eids,
                    const igraph_vector_int_t *pairs,
                    igraph_bool_t directed, igraph_bool_t error);
]#

# 4.2.10. igraph_get_eids_multi — Query edge ids based on their adjacent vertices, handle multiple edges.

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_get_all_eids_between
#[
igraph_error_t igraph_get_all_eids_between(
    const igraph_t *graph, igraph_vector_int_t *eids,
    igraph_integer_t source, igraph_integer_t target, igraph_bool_t directed
);
]#

# 4.2.11. igraph_neighbors — Adjacent vertices to a vertex.

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_neighbors
#[
igraph_error_t igraph_neighbors(const igraph_t *graph, igraph_vector_int_t *neis, igraph_integer_t pnode,
        igraph_neimode_t mode);
]#

# 4.2.12. igraph_incident — Gives the incident edges of a vertex.

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_incident
#[
igraph_error_t igraph_incident(const igraph_t *graph, igraph_vector_int_t *eids, igraph_integer_t pnode,
        igraph_neimode_t mode);
]#


# 4.2.13. igraph_is_directed — Is this a directed graph?
proc isDirected*(g:Graph):bool =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_is_directed
  igraph_is_directed(g.handle.addr)

# 4.2.14. igraph_is_same_graph — Are two graphs identical as labelled graphs?


# 4.2.15. igraph_degree — The degree of some vertices in a graph.
proc degree*(g:Graph):VectorInt =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_degree
  var tmp = newVectorInt()
  var ret = igraph_degree(g.handle.addr, tmp.handle.addr, igraph_vss_all(), 
                          IGRAPH_ALL, IGRAPH_LOOPS.igraphboolt)
  #echo repr tmp
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   
  return tmp




# -------------------------------------------
# 4.3. Adding and deleting vertices and edges
# -------------------------------------------
# https://igraph.org/c/html/0.9.4/igraph-Basic.html#adding-and-deleting-vertices-and-edges

# 4.3.1. igraph_add_edge — Adds a single edge to a graph.
proc addEdge*(g:Graph; a,b:int) =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_add_edge
  var ret = igraph_add_edge(g.handle.addr, a, b) #igraph_integer_t from, igraph_integer_t to)
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort  

# 4.3.2. igraph_add_edges — Adds edges to a graph object.
proc addEdges*(g:Graph; edges:seq[int]) =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_add_edges
  # const igraph_vector_int_t *edges
  var tmp = edges.toOther()
  var ret = igraph_add_edges(g.handle.addr, tmp.addr, nil)
                     #void *attr)
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   

# 4.3.3. igraph_add_vertices — Adds vertices to a graph.
proc addVertices*(g:Graph; vertex:int) =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_add_vertices
  var ret = igraph_add_vertices(g.handle.addr, vertex, nil) #void *attr);
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   


# 4.3.4. igraph_delete_edges — Removes edges from a graph.
# https://igraph.org/c/html/0.9.4/igraph-Basic.html#igraph_delete_edges
#[
igraph_error_t igraph_delete_edges(igraph_t *graph, igraph_es_t edges);
]#

# 4.3.5. igraph_delete_vertices — Removes vertices (with all their edges) from the graph.
# https://igraph.org/c/html/0.9.4/igraph-Basic.html#igraph_delete_vertices
#[
igraph_error_t igraph_delete_vertices(igraph_t *graph, const igraph_vs_t vertices);
]#


# 4.3.6. igraph_delete_vertices_idx
# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_delete_vertices_idx
#[
igraph_error_t igraph_delete_vertices_idx(
    igraph_t *graph, const igraph_vs_t vertices, igraph_vector_int_t *idx,
    igraph_vector_int_t *invidx
);
]#
