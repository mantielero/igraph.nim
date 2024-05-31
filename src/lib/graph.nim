import ../wrapper/igraph_wrapper


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

# --------------

#----
type
  VectorIntObj* = object
    handle*:igraphvectorintt
  VectorInt* = ref VectorIntObj

  VectorRealObj* = object
    handle*:igraphvectort
  VectorReal* = ref VectorRealObj

proc `=destroy`*(v:VectorIntObj) =
  igraph_vector_int_destroy(v.handle.addr)

proc `=destroy`*(v:VectorRealObj) =
  igraph_vector_destroy(v.handle.addr)





# https://igraph.org/c/doc/igraph-Data-structures.html
# Data Structures
#[
  igraph_vector_int_init(&result, 0);
  igraph_vector_init(&result_real, 0);
]#



proc newVectorInt*(size:int = 0):VectorInt =
  # https://igraph.org/c/doc/igraph-Data-structures.html#igraph_vector_init
  result = new VectorInt
  var ret = igraph_vector_int_init(result.handle.addr, size.igraph_integer_t)  
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   

proc newVectorReal*(size:int = 0):VectorReal =
  result = new VectorReal
  # https://igraph.org/c/doc/igraph-Data-structures.html#igraph_vector_init
  var ret = igraph_vector_init(result.handle.addr, size.igraph_integer_t)  
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   


# ----




proc max*(data:VectorInt):int = 
  igraph_vector_int_max(data.handle.addr).int

proc whichMax*(data:VectorInt):int = 
  igraph_vector_int_which_max(data.handle.addr).int


#---------



# ------------------------------------
# Graph - constructors and destructors
# ------------------------------------
# https://igraph.org/c/html/latest/igraph-Basic.html#graph-constructors-and-destructors

type
  GraphObj* = object 
    handle*:igrapht
  Graph* = ref GraphObj
  #DirectedType = enumigraphidirectedt

let
  directed*   = Igraphdirected
  undirected* = Igraphundirected

proc `=destroy`*(g:GraphObj) =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_destroy
  igraph_destroy(g.handle.addr)

proc createUndirected*(edges:seq[int]; n:int = 0):Graph =
  # https://igraph.org/c/doc/igraph-Generators.html#igraph_create
  result = new Graph
  var tmp = edges.toOther()
  var ret = igraph_create(result.handle.addr, 
                          tmp.addr, 
                          n, 
                          IGRAPH_UNDIRECTED.igraphboolt)
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort  




proc newGraph*(nVertices:int; directed:enumigraphidirectedt):Graph =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_empty
  result = new Graph  
  var ret = igraph_empty(result.handle.addr, nVertices, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort  


# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_empty_attrs

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_copy


# ------------------------------
# Graph - basic query operations
# ------------------------------
# https://igraph.org/c/html/latest/igraph-Basic.html#basic-query-operations

proc vCount*(g:Graph):int =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount
  (igraph_vcount(g.handle.addr)).int

proc eCount*(g:Graph):int =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_ecount
  (igraph_ecount(g.handle.addr)).int

proc isDirected*(g:Graph):bool =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_is_directed
  igraph_is_directed(g.handle.addr)


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

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges
# igraph_error_t igraph_edges(const igraph_t *graph, igraph_es_t eids, igraph_vector_int_t *edges);

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#IGRAPH_FROM

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#IGRAPH_TO

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#IGRAPH_OTHER

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_get_eid
#[
igraph_error_t igraph_get_eid(const igraph_t *graph, igraph_integer_t *eid,
                   igraph_integer_t from, igraph_integer_t to,
                   igraph_bool_t directed, igraph_bool_t error);
]#

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_get_eids
#[
igraph_error_t igraph_get_eids(const igraph_t *graph, igraph_vector_int_t *eids,
                    const igraph_vector_int_t *pairs,
                    igraph_bool_t directed, igraph_bool_t error);
]#


# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_get_all_eids_between
#[
igraph_error_t igraph_get_all_eids_between(
    const igraph_t *graph, igraph_vector_int_t *eids,
    igraph_integer_t source, igraph_integer_t target, igraph_bool_t directed
);
]#

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_neighbors
#[
igraph_error_t igraph_neighbors(const igraph_t *graph, igraph_vector_int_t *neis, igraph_integer_t pnode,
        igraph_neimode_t mode);
]#

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_incident
#[
igraph_error_t igraph_incident(const igraph_t *graph, igraph_vector_int_t *eids, igraph_integer_t pnode,
        igraph_neimode_t mode);
]#

proc degree*(g:Graph):VectorInt =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_degree
  var tmp = newVectorInt()
  var ret = igraph_degree(g.handle.addr, tmp.handle.addr, igraph_vss_all(), 
                          IGRAPH_ALL, IGRAPH_LOOPS.igraphboolt)
  #echo repr tmp
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   
  return tmp

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_degree_1




# ----------------------------------------------
# Graph - adding and deleting vertices and edges
# ----------------------------------------------
# https://igraph.org/c/html/latest/igraph-Basic.html#adding-and-deleting-vertices-and-edges

proc addEdge*(g:Graph; a,b:int) =
  # TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_add_edge
  var ret = igraph_add_edge(g.handle.addr, a, b) #igraph_integer_t from, igraph_integer_t to)
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   

proc addEdges*(g:Graph; edges:seq[int]) =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_add_edges
  # const igraph_vector_int_t *edges
  var tmp = edges.toOther()
  var ret = igraph_add_edges(g.handle.addr, tmp.addr, nil)
                     #void *attr)
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   


proc addVertices*(g:Graph; vertex:int) =
  # https://igraph.org/c/html/latest/igraph-Basic.html#igraph_add_vertices
  var ret = igraph_add_vertices(g.handle.addr, vertex, nil) #void *attr);
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort     

#proc deleteEdges*(g:Graph; )
# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_delete_edges
#[
igraph_error_t igraph_delete_edges(igraph_t *graph, igraph_es_t edges);
]#

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_delete_vertices
#[
igraph_error_t igraph_delete_vertices(igraph_t *graph, const igraph_vs_t vertices);
]#

# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_delete_vertices_idx
#[
igraph_error_t igraph_delete_vertices_idx(
    igraph_t *graph, const igraph_vs_t vertices, igraph_vector_int_t *idx,
    igraph_vector_int_t *invidx
);
]#

# -------------------------
type
  RngObj* = object
    handle*:ptr igraph_rng_t
  Rng* = ref RngObj

proc rngDefault*():Rng =
  result = new Rng
  result.handle = igraphrngdefault()

proc seed*(r:Rng; seed:int) =
  # https://igraph.org/c/doc/igraph-Random.html#igraph_rng_seed
  var ret = igraphrngseed(r.handle, seed.igraphuintt) # igrapherrort igraph_error_t
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort


# Games
# Depigraph_erdos_renyi_game - depricated
proc erdosRenyiGameGnm*(vertices,edges:int; 
      directed:enumigraphidirectedt;
      loops:enumigraphloopst):Graph =
  # https://igraph.org/c/doc/igraph-Generators.html#igraph_erdos_renyi_game_gnm
  result = new Graph
  var ret = igraph_erdos_renyi_game_gnm(result.handle.addr, # result[].addr 
              vertices.igraphintegert, edges.igraphintegert, 
              directed.igraphboolt, loops.igraphboolt)
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort

# 
proc diameter*(g:Graph):float =
  # https://igraph.org/c/doc/igraph-Structural.html#igraph_diameter
  var diameter:cfloat
  var ret3 = igraph_diameter(g.handle.addr, 
                  cast[ptr igraphrealt](diameter.addr), 
                  nil, nil, nil, nil, 
                  IGRAPH_UNDIRECTED.igraphboolt,  
                  true # unconn=
                  )
  if ret3 != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort
  return diameter.float





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