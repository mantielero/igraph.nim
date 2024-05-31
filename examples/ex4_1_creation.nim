import igraph

proc main =
  # Create a directed graph with no vertices or edges.
  let graph = newGraph(0, directed)
  
  # Add 5 vertices. Vertex IDs will range from 0 to 4, inclusive.
  graph.addVertices(5)

  # Add 5 edges, specified as 5 consecutive pairs of vertex IDs
  # stored in an integer vector.
  graph.addEdges(@[0,1, 0,2, 3,1, 2,1, 0,4])

  # Now the graph has 5 vertices and 5 edges.
  assert graph.vCount == 5
  assert graph.eCount == 5

main()