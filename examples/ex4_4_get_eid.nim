import igraph

proc main =
  # DIRECTED
  var g = newStar(10, IGRAPH_STAR_OUT, 0)
  var hist = newSeq[int](9)
  for i in 1..<10:
      var eid = g.getEid(0, i, IGRAPH_DIRECTED, 
                         true) # reports error if edge not found
      hist[ eid ] = 1
  echo hist

  # UNDIRECTED
  g = newStar(10, IGRAPH_STAR_UNDIRECTED, 0)
  hist = newSeq[int](9)
  for i in 1..<10:
      var eid = g.getEid(0, i, IGRAPH_UNDIRECTED, true) 
      hist[ eid ] += 1
      eid = g.getEid(0, i, IGRAPH_DIRECTED, true)
      hist[ eid ] += 1
  echo hist

main()