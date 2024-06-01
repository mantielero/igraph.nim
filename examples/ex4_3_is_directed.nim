import igraph

proc main =

    var g = newGraph(0,directed)
    if g.isDirected:
      echo "Directed"

    g = newGraph(0, undirected)
    if not g.isDirected:
      echo "UnDirected"

main()