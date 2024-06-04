import ../wrapper/igraph_wrapper
import defs, graph
# Chapter 9. Graph generators
# https://igraph.org/c/doc/igraph-Generators.html

# ---------------------------------
# 1. Deterministic graph generators
# ---------------------------------
# https://igraph.org/c/doc/igraph-Generators.html#deterministic-graph-generators

# 1.1. igraph_create — Creates a graph with the specified edges.
# 1.2. igraph_small — Shorthand to create a small graph, giving the edges as arguments.
proc newSmall*(n:int; directed:enumigraphidirectedt; values: varargs[int]):Graph =
  # https://igraph.org/c/doc/igraph-Generators.html#igraph_small
  result = new Graph
  var tmp = newSeq[cint]() #@values
  for i in values:
    tmp &= i.cint
  if tmp.len mod 2 == 0:
    tmp &= -1.cint

  var ret = igraph_small(result.handle.addr, n, directed.igraph_bool_t, tmp) # [])
  if ret != SUCCESS:
    raise newException(ValueError, "error")


# 1.3. igraph_adjacency — Creates a graph from an adjacency matrix.
# 1.4. igraph_weighted_adjacency — Creates a graph from a weighted adjacency matrix.
# 1.5. igraph_sparse_adjacency — Creates a graph from a sparse adjacency matrix.
# 1.6. igraph_sparse_weighted_adjacency — Creates a graph from a weighted sparse adjacency matrix.
# 1.7. igraph_adjlist — Creates a graph from an adjacency list.
# 1.8. igraph_star — Creates a star graph, every vertex connects only to the center.
proc newStar*(n:int; mode:igraph_star_mode_t; center:int):Graph =
  # https://igraph.org/c/doc/igraph-Generators.html#igraph_star
  result = new Graph
  var ret = igraph_star(result.handle.addr, n, 
                        mode,
                        center)
  if ret != SUCCESS:
    raise newException(ValueError, "error")

# 1.9. igraph_wheel — Creates a wheel graph, a union of a star and a cycle graph.
# 1.10. igraph_square_lattice — Arbitrary dimensional square lattices.
# 1.11. igraph_triangular_lattice — A triangular lattice with the given shape.
# 1.12. igraph_hexagonal_lattice — A hexagonal lattice with the given shape.
# 1.13. igraph_ring — Creates a cycle graph or a path graph.
# 1.14. igraph_kary_tree — Creates a k-ary tree in which almost all vertices have k children.
# 1.15. igraph_symmetric_tree — Creates a symmetric tree with the specified number of branches at each level.
# 1.16. igraph_regular_tree — Creates a regular tree.

# 1.17. igraph_full — Creates a full graph (complete graph).
# https://igraph.org/c/doc/igraph-Generators.html#igraph_full
proc full*(n:int;directed:bool; loops:enumigraphloopst):Graph =
  result = new Graph
  var ret = igraph_full(result.handle.addr, n, directed, loops.igraphboolt)
  if ret != SUCCESS:
    raise newException(ValueError, "error")


# 1.18. igraph_full_citation — Creates a full citation graph (a complete directed acyclic graph).
# 1.19. igraph_full_multipartite — Creates a full multipartite graph.
# 1.20. igraph_turan — Creates a Turán graph.
# 1.21. igraph_realize_degree_sequence — Generates a graph with the given degree sequence.
# 1.22. igraph_realize_bipartite_degree_sequence — Generates a bipartite graph with the given bidegree sequence.
# 1.23. igraph_famous — Create a famous graph by simply providing its name.
# 1.24. igraph_lcf — Creates a graph from LCF notation.
# 1.25. igraph_lcf_vector — Creates a graph from LCF notation.
# 1.26. igraph_from_prufer — Generates a tree from a Prüfer sequence.
# 1.27. igraph_atlas — Create a small graph from the “Graph Atlas”.
# 1.28. igraph_de_bruijn — Generate a de Bruijn graph.
# 1.29. igraph_kautz — Generate a Kautz graph.
# 1.30. igraph_circulant — Creates a circulant graph.
# 1.31. igraph_generalized_petersen — Creates a Generalized Petersen graph.
# 1.32. igraph_extended_chordal_ring — Create an extended chordal ring.

# -------------------------------------
# 2. Games: Randomized graph generators
# -------------------------------------

# 2.1. igraph_grg_game — Generates a geometric random graph.
# 2.2. igraph_barabasi_game — Generates a graph based on the Barabási-Albert model.

# 2.3. igraph_erdos_renyi_game_gnm — Generates a random (Erdős-Rényi) graph with a fixed number of edges.
proc newErdosRenyiGameGnm*(vertices,edges:int; 
                           directed:enumigraphidirectedt;
                           loops:enumigraphloopst):Graph =
  # https://igraph.org/c/doc/igraph-Generators.html#igraph_erdos_renyi_game_gnm
  result = new Graph
  var ret = igraph_erdos_renyi_game_gnm(result.handle.addr,
              vertices, edges, 
              directed.igraphboolt, loops.igraphboolt)
  if ret != SUCCESS:
    raise newException(ValueError, "failed" ) # igrapherrort


# 2.4. igraph_erdos_renyi_game_gnp — Generates a random (Erdős-Rényi) graph with fixed edge probabilities.
proc newErdosRenyiGameGnp*(vertices:int; probability: float;
                           directed:enumigraphidirectedt;
                           loops:enumigraphloopst):Graph =
  # https://igraph.org/c/html/latest/igraph-Generators.html#igraph_erdos_renyi_game_gnp
  result = new Graph
  var ret = igraph_erdos_renyi_game_gnp(result.handle.addr,
              vertices, probability, 
              directed.igraphboolt, loops.igraphboolt)
  if ret != SUCCESS:
    raise newException(ValueError, "failed" ) # igrapherrort




# 2.5. igraph_watts_strogatz_game — The Watts-Strogatz small-world model.
# 2.6. igraph_rewire_edges — Rewires the edges of a graph with constant probability.
# 2.7. igraph_rewire_directed_edges — Rewires the chosen endpoint of directed edges.
# 2.8. igraph_degree_sequence_game — Generates a random graph with a given degree sequence.
# 2.9. igraph_k_regular_game — Generates a random graph where each vertex has the same degree.
# 2.10. igraph_static_fitness_game — Non-growing random graph with edge probabilities proportional to node fitness scores.
# 2.11. igraph_static_power_law_game — Generates a non-growing random graph with expected power-law degree distributions.
# 2.12. igraph_forest_fire_game — Generates a network according to the “forest fire game”.
# 2.13. igraph_rewire — Randomly rewires a graph while preserving its degree sequence.
# 2.14. igraph_growing_random_game — Generates a growing random graph.
# 2.15. igraph_callaway_traits_game — Simulates a growing network with vertex types.
# 2.16. igraph_establishment_game — Generates a graph with a simple growing model with vertex types.
# 2.17. igraph_preference_game — Generates a graph with vertex types and connection preferences.
# 2.18. igraph_asymmetric_preference_game — Generates a graph with asymmetric vertex types and connection preferences.
# 2.19. igraph_recent_degree_game — Stochastic graph generator based on the number of incident edges a node has gained recently.
# 2.20. igraph_barabasi_aging_game — Preferential attachment with aging of vertices.
# 2.21. igraph_recent_degree_aging_game — Preferential attachment based on the number of edges gained recently, with aging of vertices.
# 2.22. igraph_lastcit_game — Simulates a citation network, based on time passed since the last citation.
# 2.23. igraph_cited_type_game — Simulates a citation based on vertex types.
# 2.24. igraph_citing_cited_type_game — Simulates a citation network based on vertex types.
# 2.25. igraph_sbm_game — Sample from a stochastic block model.
# 2.26. igraph_hsbm_game — Hierarchical stochastic block model.
# 2.27. igraph_hsbm_list_game — Hierarchical stochastic block model, more general version.
# 2.28. igraph_dot_product_game — Generates a random dot product graph.
# 2.29. igraph_tree_game — Generates a random tree with the given number of nodes.
# 2.30. igraph_correlated_game — Generates a random graph correlated to an existing graph.
# 2.31. igraph_correlated_pair_game — Generates pairs of correlated random graphs.
# 2.32. igraph_simple_interconnected_islands_game — Generates a random graph made of several interconnected islands, each island being a random graph.






# 3. Deprecated functions