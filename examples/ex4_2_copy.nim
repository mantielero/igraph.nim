import igraph

proc main =

  # igraph_t g1, g2;
  # igraph_vector_t v1, v2;

  # igraph_vector_init(&v1, 8);
  # VECTOR(v1)[0] = 0;
  # VECTOR(v1)[1] = 1;
  # VECTOR(v1)[2] = 1;
  # VECTOR(v1)[3] = 2;
  # VECTOR(v1)[4] = 2;
  # VECTOR(v1)[5] = 3;
  # VECTOR(v1)[6] = 2;
  # VECTOR(v1)[7] = 2;
  var v1 = @[0,1,1,2,2,3,2,2]
  let g1 = newGraph(v1, 0, 0)#igraph_create(&g1, &v1, 0, 0);
  #igraph_copy(&g2, &g1);
  var g2 = new Graph
  g2 = g1

  #igraph_vector_init(&v2, 0);
  #igraph_get_edgelist(&g2, &v2, 0);
  #if (!igraph_vector_all_e(&v1, &v2)) {
  #    return 1;
  #}

  #igraph_vector_destroy(&v1);
  #igraph_vector_destroy(&v2);
  #igraph_destroy(&g1);
  #igraph_destroy(&g2);

  return 0;
