import igraph

proc main =
  var g = newSmall(4, DIRECTED, 0,1, 1,2, 2,3, 2,2)

  var v = g.neighbors(2, IGRAPH_OUT)
  #v.sort()
  v.print()

  v = g.neighbors(2, IGRAPH_IN)
  #v.sort()
  v.print()

  v = g.neighbors(2, IGRAPH_ALL)
  #v.sort()
  v.print()

main()