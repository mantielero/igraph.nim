import ../wrapper/igraph_wrapper
import defs, graph


# --------------


proc createUndirected*(edges:seq[int]; n:int = 0):Graph =
  # https://igraph.org/c/doc/igraph-Generators.html#igraph_create
  result = new Graph
  var tmp = edges.toVectorViewInt()
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


# igraph_random.h:#define RNG_INTEGER(l,h) (igraph_rng_get_integer(igraph_rng_default(),(l),(h)))
proc rngInteger*(l,h:int):int =
  var rng = rngDefault()
  var res = igraph_rng_get_integer(rng.handle, l.igraphintegert, h.igraphintegert)
  return res.int
  #return tmp.int
#[
proc igraphrnggetinteger*(rng: ptr igraphrngt; l: igraphintegert;
                          h: igraphintegert): igraphintegert {.cdecl,
    importc: "igraph_rng_get_integer".}
]#