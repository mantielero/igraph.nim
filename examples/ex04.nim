import igraph

proc main =
  var g = newGraph(6,directed)
  echo g.isDirected()
  g.addEdge(0,1)
  g.addEdges(@[1,2, 4,5])
  var edge = g.edge(0)
  echo edge

  g.addVertices(3)
main()