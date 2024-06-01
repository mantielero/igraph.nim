import ../wrapper/igraph_wrapper
import defs, graph


# --------------


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



# TODO: https://igraph.org/c/html/latest/igraph-Basic.html#igraph_degree_1




# ----------------------------------------------
# Graph - adding and deleting vertices and edges
# ----------------------------------------------
# https://igraph.org/c/html/latest/igraph-Basic.html#adding-and-deleting-vertices-and-edges

 

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





                     