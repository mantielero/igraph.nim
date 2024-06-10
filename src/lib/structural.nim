import ../wrapper/igraph_wrapper
import defs,graph
import std/strformat

# ===========================================
# Chapter 13. Structural properties of graphs
# ===========================================
# https://igraph.org/c/html/latest/igraph-Structural.html


# 1. Basic properties
# 2. Sparsifiers


# ------------------------------------
# 3. (Shortest)-path related functions
# ------------------------------------
# https://igraph.org/c/html/latest/igraph-Structural.html#shortest-path-related-functions

# 3.1. igraph_distances — Length of the shortest paths between vertices.
# 3.2. igraph_distances_cutoff — Length of the shortest paths between vertices, with cutoff.
# 3.3. igraph_distances_dijkstra — Weighted shortest path lengths between vertices.
# 3.4. igraph_distances_dijkstra_cutoff — Weighted shortest path lengths between vertices, with cutoff.
# 3.5. igraph_distances_bellman_ford — Weighted shortest path lengths between vertices, allowing negative weights.
# 3.6. igraph_distances_johnson — Weighted shortest path lengths between vertices, using Johnson's algorithm.
# 3.7. igraph_distances_floyd_warshall — Weighted all-pairs shortest path lengths with the Floyd-Warshall algorithm.
# 3.8. igraph_get_shortest_paths — Shortest paths from a vertex.
# 3.9. igraph_get_shortest_path — Shortest path from one vertex to another one.
# 3.10. igraph_get_shortest_paths_dijkstra — Weighted shortest paths from a vertex.
# 3.11. igraph_get_shortest_path_dijkstra — Weighted shortest path from one vertex to another one (Dijkstra).
# 3.12. igraph_get_shortest_paths_bellman_ford — Weighted shortest paths from a vertex, allowing negative weights.
# 3.13. igraph_get_shortest_path_bellman_ford — Weighted shortest path from one vertex to another one (Bellman-Ford).
# 3.14. igraph_get_shortest_path_astar — A* gives the shortest path from one vertex to another, with heuristic.
# 3.15. igraph_astar_heuristic_func_t — Distance estimator for A* algorithm.
# 3.16. igraph_get_all_shortest_paths — All shortest paths (geodesics) from a vertex.
# 3.17. igraph_get_all_shortest_paths_dijkstra — All weighted shortest paths (geodesics) from a vertex.
# 3.18. igraph_get_k_shortest_paths — k shortest paths between two vertices.
# 3.19. igraph_get_all_simple_paths — List all simple paths from one source.
# 3.20. igraph_average_path_length — Calculates the average unweighted shortest path length between all vertex pairs.
# 3.21. igraph_average_path_length_dijkstra — Calculates the average weighted shortest path length between all vertex pairs.
# 3.22. igraph_path_length_hist — Create a histogram of all shortest path lengths.
# 3.23. igraph_diameter — Calculates the diameter of a graph (longest geodesic).
proc diameter*(g:Graph; 
               src,dst:int = -1; 
               vertexPath:seq[int] = @[];
               edgePath:seq[int]   = @[];
               directed:enumigraphidirectedt = UNDIRECTED;
               unconnected:bool = true):float =
  # https://igraph.org/c/doc/igraph-Structural.html#igraph_diameter
  var diameter:igraphrealt
  var srcVal,dstVal:ptr igraphintegert
  if src > -1:
    srcVal = cast[ptr igraphintegert](src.addr)
  if dst > -1:
    dstVal = cast[ptr igraphintegert](dst.addr)
  var vPath,ePath:igraphvectorintt
  #var vPath:igraphvectorintt
  var vPathPtr:ptr igraphvectorintt = nil
  var ePathPtr:ptr igraphvectorintt = nil
  if vertexPath.len > 0:
    vPath = vertexPath.toVectorViewInt() #vertexPath[0].addr
    vPathPtr = vPath.addr
  if edgePath.len > 0:
    ePath = edgePath.toVectorViewInt()
    ePathPtr = ePath.addr

  var ret = igraph_diameter(g.handle.addr, 
                  diameter.addr, 
                  srcVal, dstVal, 
                  vPathPtr, ePathPtr, 
                  UNDIRECTED, 
                  unconnected
                  )
  if ret != SUCCESS:
    raise newException(ValueError, "failed" ) # igrapherrort
  return diameter.float

#[
igraph_error_t igraph_diameter(const igraph_t *graph, igraph_real_t *res,
                    igraph_integer_t *from, igraph_integer_t *to,
                    igraph_vector_int_t *vertex_path, igraph_vector_int_t *edge_path,
                    igraph_bool_t directed, igraph_bool_t unconn);
]#

# 3.24. igraph_diameter_dijkstra — Calculates the weighted diameter of a graph using Dijkstra's algorithm.
# 3.25. igraph_girth — The girth of a graph is the length of the shortest cycle in it.
# 3.26. igraph_eccentricity — Eccentricity of some vertices.
# 3.27. igraph_eccentricity_dijkstra — Eccentricity of some vertices, using weighted edges.
# 3.28. igraph_radius — Radius of a graph.
# 3.29. igraph_radius_dijkstra — Radius of a graph, using weighted edges.
# 3.30. igraph_graph_center — Central vertices of a graph.
# 3.31. igraph_graph_center_dijkstra — Central vertices of a graph, using weighted edges.
# 3.32. igraph_pseudo_diameter — Approximation and lower bound of diameter.
# 3.33. igraph_pseudo_diameter_dijkstra — Approximation and lower bound of the diameter of a weighted graph.
# 3.34. igraph_voronoi — Voronoi partitioning of a graph.
# 3.35. igraph_vertex_path_from_edge_path — Converts a path of edge IDs to the traversed vertex IDs.





# 4. Widest-path related functions
# 5. Efficiency measures
# 6. Neighborhood of a vertex
# 7. Local scan statistics
# 8. Graph components
# 9. Degree sequences

# -----------------------
# 10. Centrality measures
# -----------------------
# https://igraph.org/c/doc/igraph-Structural.html#centrality-measures

# 10.1. igraph_closeness — Closeness centrality calculations for some vertices.
# 10.2. igraph_harmonic_centrality — Harmonic centrality for some vertices.
# 10.3. igraph_betweenness — Betweenness centrality of some vertices.
# 10.4. igraph_edge_betweenness — Betweenness centrality of the edges.
# 10.5. igraph_pagerank_algo_t — PageRank algorithm implementation.
# 10.6. igraph_pagerank — Calculates the Google PageRank for the specified vertices.
# 10.7. igraph_personalized_pagerank — Calculates the personalized Google PageRank for the specified vertices.
# 10.8. igraph_personalized_pagerank_vs — Calculates the personalized Google PageRank for the specified vertices.
# 10.9. igraph_constraint — Burt's constraint scores.
# 10.10. igraph_maxdegree — The maximum degree in a graph (or set of vertices).
proc maxDegree*(graph:Graph; vids:igraphvst; mode:igraphneimodet; loops:enumigraphloopst):int =
  # https://igraph.org/c/doc/igraph-Structural.html#igraph_maxdegree
  var res:igraphintegert

  var ret = igraph_maxdegree(graph.handle.addr, res.addr, vids, mode, loops.igraphboolt)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  
  return (res.int)


# 10.11. igraph_strength — Strength of the vertices, also called weighted vertex degree.
# 10.12. igraph_eigenvector_centrality — Eigenvector centrality of the vertices.
# 10.13. igraph_hub_and_authority_scores — Kleinberg's hub and authority scores (HITS).
# 10.14. igraph_convergence_degree — Calculates the convergence degree of each edge in a graph.



# 11. Range-limited centrality measures
# 12. Subset-limited centrality measures
# 13. Centralization
# 14. Similarity measures
# 15. Trees and forests
# 16. Transitivity or clustering coefficient
# 17. Directedness conversion
# 18. Spectral properties
# 19. Non-simple graphs: Multiple and loop edges
# 20. Mixing patterns
# 21. K-cores and k-trusses
# 22. Topological sorting, directed acyclic graphs
# 23. Maximum cardinality search and chordal graphs
# 24. Matchings
# 25. Unfolding a graph into a tree
# 26. Other operations
# 27. Deprecated functions



