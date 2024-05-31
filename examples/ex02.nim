import igraph
import std/strformat

proc main =
  var numVertices = 500
  var numEdges = 600

  var rng = rngDefault()
  rng.seed(42)

  var graph = erdosRenyiGameGnm(numVertices, numEdges, IGRAPH_UNDIRECTED, IGRAPH_NO_LOOPS)
  var diameter = graph.diameter()

  var tmp = eCount(graph)
  var degree = 2 * tmp / vCount(graph)
  echo &"Diameter of a random graph with average degree {degree:0}"
  echo "- Vertices number: ", graph.vCount()
  echo "- Edges number: ", graph.eCount()
  echo "- Diameter: ", diameter

main()
