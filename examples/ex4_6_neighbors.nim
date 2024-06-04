import igraph

proc main =
  #igraph_t g;
  #igraph_vector_int_t v;

  #igraph_vector_int_init(&v, 0);
  var g = newSmall(4, DIRECTED, 0,1, 1,2, 2,3, 2,2, -1)

  var v = g.neighbors(2, IGRAPH_OUT)
  echo v
  # igraph_vector_int_sort(&v);
  # igraph_vector_int_print(&v);

  # igraph_neighbors(&g, &v, 2, IGRAPH_IN);
  # igraph_vector_int_sort(&v);
  # igraph_vector_int_print(&v);

  # igraph_neighbors(&g, &v, 2, IGRAPH_ALL);
  # igraph_vector_int_sort(&v);
  # igraph_vector_int_print(&v);

  # igraph_vector_int_destroy(&v);
  # igraph_destroy(&g);
  # return 0;

main()