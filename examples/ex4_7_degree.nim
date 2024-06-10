import igraph

proc handshakingLemma(g:Graph; v:VectorInt):bool =
  ## Consistency check of the handshaking lemma:
  ##   If d is the sum of all vertex degrees, then d = 2|E|.
  v.sum() == 2 * g.eCount()
  

proc main =
  # Create graph
  var g = newSmall(4, DIRECTED, 0,1, 1,2, 2,3, 2,2)

  var v = g.degree(igraph_vss_all(), IGRAPH_OUT, IGRAPH_NO_LOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_OUT, IGRAPH_LOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_IN, IGRAPH_NO_LOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_IN, LOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_ALL, NOLOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_ALL, LOOPS)
  v.print()

  assert g.handshakingLemma(v)

  g = newSmall(4,UNDIRECTED, 0,1, 1,2, 2,3, 2,2)

  v = g.degree(igraph_vss_all(), IGRAPH_OUT, NOLOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_OUT, LOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_IN, NOLOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_IN, LOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_ALL, NOLOOPS)
  v.print()

  v = g.degree(igraph_vss_all(), IGRAPH_ALL, LOOPS)
  v.print()

  assert g.handshakingLemma(v)

  # Degree of the same vertex multiple times
  var v2 = newVectorInt(3)
  v2[0] = 2
  v2[1] = 0
  v2[2] = 2

  v = g.degree(v2.vssVector, IGRAPH_ALL, LOOPS)
  v.print()

  # Maximum degree
  g = newRing(10, UNDIRECTED, false, false) # mutual, circular
  var mdeg = g.maxDegree(igraph_vss_all(), IGRAPH_ALL, LOOPS)
  assert mdeg == 2

  v = g.degree(igraph_vss_all(), IGRAPH_ALL, IGRAPH_LOOPS)
  assert g.handshakingLemma(v)

  g = newFull(10, IGRAPH_UNDIRECTED, NOLOOPS)
  mdeg = g.maxDegree(igraph_vss_all(), IGRAPH_ALL, IGRAPH_LOOPS)
  assert mdeg == 9


  v = g.degree(igraph_vss_all(), IGRAPH_ALL, IGRAPH_LOOPS)
  assert g.handshakingLemma(v)    

  g = newStar(10, IGRAPH_STAR_OUT, 0 ) # center
  mdeg = g.maxDegree(igraph_vss_all(), IGRAPH_OUT, LOOPS)
  assert mdeg == 9

  mdeg = g.maxDegree(igraph_vss_all(), IGRAPH_IN, LOOPS)
  assert mdeg == 1

  mdeg = g.maxDegree(igraph_vss_all(), IGRAPH_ALL, LOOPS)
  assert mdeg == 9

  mdeg = g.maxDegree(igraph_vss_all(), IGRAPH_ALL, LOOPS)
  assert mdeg == 9

  v = g.degree(igraph_vss_all(), IGRAPH_ALL, IGRAPH_LOOPS)
  assert g.handshakingLemma(v)     

main()