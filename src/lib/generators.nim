import ../wrapper/igraph_wrapper
import basic_interface, defs
# Chapter 9. Graph generators
# https://igraph.org/c/doc/igraph-Generators.html

# ---------------------------------
# 1. Deterministic graph generators
# ---------------------------------
# https://igraph.org/c/doc/igraph-Generators.html#deterministic-graph-generators

# 1.1. igraph_create — Creates a graph with the specified edges.
# 1.2. igraph_small — Shorthand to create a small graph, giving the edges as arguments.
# 1.3. igraph_adjacency — Creates a graph from an adjacency matrix.
# 1.4. igraph_weighted_adjacency — Creates a graph from a weighted adjacency matrix.
# 1.5. igraph_sparse_adjacency — Creates a graph from a sparse adjacency matrix.
# 1.6. igraph_sparse_weighted_adjacency — Creates a graph from a weighted sparse adjacency matrix.
# 1.7. igraph_adjlist — Creates a graph from an adjacency list.
# 1.8. igraph_star — Creates a star graph, every vertex connects only to the center.
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
  if ret != success:
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

# 2. Games: Randomized graph generators


# 3. Deprecated functions