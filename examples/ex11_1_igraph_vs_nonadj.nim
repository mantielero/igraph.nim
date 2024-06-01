import igraph

proc main =
  # empty graph, all vertices
  var g = newGraph(10,directed)
  var vs = vsNonAdj(0, IGRAPH_ALL)
  var size = g.size(vs)
  echo "size: ", size

  for i in g.items(vs):
    echo i

  # full graph, no vertices
  g = full(10, undirected, loops)
  vs = vsNonAdj(0, IGRAPH_ALL)
  echo "size: ", size  
  for i in g.items(vs):
    echo i

main()