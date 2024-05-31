{.passL:"-ligraph".}
import igraph
import std/strformat

proc main =
  var numVertices = 1000
  var numEdges = 1000
  var diameter:cfloat
  var graph:igrapht

  var ret1 = igraph_rng_seed(igraph_rng_default(), 42)

  var ret2 = igraph_erdos_renyi_game(graph.addr, IGRAPH_ERDOS_RENYI_GNM,
                          numVertices, numEdges.igraphrealt,
                          IGRAPH_UNDIRECTED.igraphboolt, IGRAPH_NO_LOOPS.igraphboolt)

  var ret3 = igraph_diameter(graph.addr, cast[ptr igraphrealt](diameter.addr), nil, nil, nil, nil, 
                  IGRAPH_UNDIRECTED.igraphboolt,  
                  true # unconn=
                  )
  var tmp = (igraph_ecount(graph.addr)).int64.float
  #echo typeof(tmp.int64)
  var degree = int64(2.0 * tmp / float(igraph_vcount(graph.addr)))
  #var degree = 20
  echo &"Diameter of a random graph with average degree {degree}: {igraph_vcount(graph.addr)}"
  igraph_destroy(graph.addr)

main()
