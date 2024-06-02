import igraph

proc main =
  var numNodes = 100
  var numEdges = 1000
  var p = 3 / numNodes  # Probability of edge appearance
  var runs = 10

  rngDefault().seed(42) # make tests deterministic

  var eids,path:seq[int]
  var pairs = newSeq[int](numEdges * 2)

  for r in 0..<runs:
    # igraph_vector_int_resize(&pairs, edges * 2);
    # igraph_vector_int_clear(&path);
    # igraph_vector_int_clear(&eids);

    var g = newErdosRenyiGameGnp(numNodes, p, UNDIRECTED, NOLOOPS)
    var edgeCount = g.eCount()

    for e in 0..<numEdges:
        var edge = rngInteger(0,edgeCount-1)
        pairs[2 * e] = g.`from`(edge) #IGRAPH_FROM(&g, edge);
        pairs[2 * e + 1] = g.to(edge)  #IGRAPH_TO(&g, edge);
    #echo pairs
    var eids = g.getEids(pairs, UNDIRECTED, 
                          true) # if error, fails
    #echo eids
    for e in 0..<numEdges:
      var edge  = eids[e]
      var from1 = pairs[2 * e]
      var to1   = pairs[2 * e + 1]
      var from2 = g.`from`(edge)
      var to2 = g.to(edge)
      var min1 = if from1 < to1: from1 else: to1
      var max1 = if from1 < to1: to1   else: from1
      var min2 = if from2 < to2: from2 else: to2
      var max2 = if from2 < to2: to2   else: from2
      if (min1 != min2 or max1 != max2):
        echo "return 11"

    var res = g.diameter(src=0, dst=0, vertexPath = path,
                    directed=IGRAPH_UNDIRECTED, 
                    unconnected=true) # if unconnected, returns longest geodesic
    #echo res
    # igraph_vector_int_update(&pairs, &path); # ??
    #igraph_expand_path_to_pairs(&pairs);
    eids = g.getEids(pairs, UNDIRECTED, true)
    for e in 0 ..< (path.len - 1):
      var edge  = eids[e]
      var from1 = pairs[e]
      var to1   = pairs[2 * e + 1]
      var from2 = g.`from`(edge)
      var to2 = g.to(edge)
      var min1 = if from1 < to1: from1 else: to1
      var max1 = if from1 < to1: to1   else: from1
      var min2 = if from2 < to2: from2 else: to2
      var max2 = if from2 < to2: to2   else: from2
      if (min1 != min2 or max1 != max2):
        echo "return 12"

main()