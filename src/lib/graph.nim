import ../wrapper/igraph_wrapper
type
  #GraphObj* = object
  #  handle*:ptr igrapht
  GraphObj* = object 
    handle*:igrapht
  Graph* = ref GraphObj

  RngObj* = object
    handle*:ptr igraph_rng_t
  Rng* = ref RngObj


proc `=destroy`*(g:GraphObj) =
  igraph_destroy(g.handle.addr)


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

proc eCount*(g:Graph):int =
  (igraph_ecount(g.handle.addr)).int

proc vCount*(g:Graph):int =
  (igraph_vcount(g.handle.addr)).int


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


converter toOther*(data:seq[int]):igraph_vector_int_t =
  var tmp:igraph_vector_int_t
  var ret = igraph_vector_int_view(tmp.addr, 
                         cast[ptr igraphintegert](data[0].addr), 
                         data.len.igraphintegert)
  # if ret != Igraphsuccess:
  #   raise newException(ValueError, "failed" ) # igrapherrort  
  return tmp

# Graph Generators
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


proc degree*(g:Graph):VectorInt =
  var tmp = newVectorInt()
  var ret = igraph_degree(g.handle.addr, tmp.handle.addr, igraph_vss_all(), 
                          IGRAPH_ALL, IGRAPH_LOOPS.igraphboolt)
  #echo repr tmp
  if ret != Igraphsuccess:
    raise newException(ValueError, "failed" ) # igrapherrort   
  return tmp

proc max*(data:VectorInt):int = 
  igraph_vector_int_max(data.handle.addr).int

proc whichMax*(data:VectorInt):int = 
  igraph_vector_int_which_max(data.handle.addr).int


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