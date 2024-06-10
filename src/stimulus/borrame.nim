import ../wrapper/igraph_wrapper
import std/strformat

type
  GraphObj* = object 
    handle*:igrapht
  Graph* = ref GraphObj


proc empty*(n:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_empty(result.handle.addr, n, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc addEdges*(edges:Vertex_index_pairs; attr:Attributes):Graph =
  result = new Graph
  var ret = igraph_add_edges(result.handle.addr, edges, attr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc addEdges*(graph:Graph; edges:Vertex_index_pairs; attr:Attributes) =
  var ret = igraph_add_edges(graph.handle.addr, edges, attr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc emptyAttrs*(n:int; directed:bool; attr:Attributes):Graph =
  result = new Graph
  var ret = igraph_empty_attrs(result.handle.addr, n, directed, attr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc addVertices*(nv:int; attr:Attributes):Graph =
  result = new Graph
  var ret = igraph_add_vertices(result.handle.addr, nv, attr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc addVertices*(graph:Graph; nv:int; attr:Attributes) =
  var ret = igraph_add_vertices(graph.handle.addr, nv, attr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc copy*(from:Graph):Graph =
  result = new Graph
  var ret = igraph_copy(result.handle.addr, from.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc deleteEdges*(edges:Edge_selector):Graph =
  result = new Graph
  var ret = igraph_delete_edges(result.handle.addr, edges)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc deleteEdges*(graph:Graph; edges:Edge_selector) =
  var ret = igraph_delete_edges(graph.handle.addr, edges)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc deleteVertices*(vertices:Vertex_selector):Graph =
  result = new Graph
  var ret = igraph_delete_vertices(result.handle.addr, vertices)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc deleteVertices*(graph:Graph; vertices:Vertex_selector) =
  var ret = igraph_delete_vertices(graph.handle.addr, vertices)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc deleteVerticesIdx*(vertices:Vertex_selector):tuple[graph:Graph; idx:NOT__MANAGED; invidx:NOT__MANAGED] =
  result = new Graph  var idx:Vector_int
  var invidx:Vector_int

  var ret = igraph_delete_vertices_idx(result.handle.addr, vertices, idx.addr, invidx.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (idx.NOT__MANAGED, invidx.NOT__MANAGED)

proc deleteVerticesIdx*(graph:Graph; vertices:Vertex_selector):tuple[idx:NOT__MANAGED; invidx:NOT__MANAGED] =
  var idx:Vector_int
  var invidx:Vector_int

  var ret = igraph_delete_vertices_idx(graph.handle.addr, vertices, idx.addr, invidx.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (idx.NOT__MANAGED, invidx.NOT__MANAGED)

proc vcount*(graph:Graph) =
  var ret = igraph_vcount(graph.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc ecount*(graph:Graph) =
  var ret = igraph_ecount(graph.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc neighbors*(graph:Graph; vid:Vertex; mode:Neimode):NOT__MANAGED =
  var neis:Vertex_indices

  var ret = igraph_neighbors(graph.handle.addr, neis.addr, vid, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (neis.NOT__MANAGED)

proc isDirected*(graph:Graph):bool =
  return ( igraph_is_directed(graph.handle.addr) ).bool


proc degree*(graph:Graph; vids:Vertex_selector; mode:Neimode; loops:bool):NOT__MANAGED =
  var res:Vector_int

  var ret = igraph_degree(graph.handle.addr, res.addr, vids, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc edge*(graph:Graph; eid:int):tuple[from:NOT__MANAGED; to:NOT__MANAGED] =
  var from:int
  var to:int

  var ret = igraph_edge(graph.handle.addr, eid, from.addr, to.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (from.NOT__MANAGED, to.NOT__MANAGED)

proc edges*(graph:Graph; eids:Edge_selector):NOT__MANAGED =
  var edges:Vector_int

  var ret = igraph_edges(graph.handle.addr, eids, edges.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edges.NOT__MANAGED)

proc getEid*(graph:Graph; from:Vertex; to:Vertex; directed:bool; error:bool):NOT__MANAGED =
  var eid:Edge

  var ret = igraph_get_eid(graph.handle.addr, eid.addr, from, to, directed, error)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (eid.NOT__MANAGED)

proc getEids*(graph:Graph; pairs:Vertex_index_pairs; directed:bool; error:bool):NOT__MANAGED =
  var eids:Edge_indices

  var ret = igraph_get_eids(graph.handle.addr, eids.addr, pairs, directed, error)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (eids.NOT__MANAGED)

proc getAllEidsBetween*(graph:Graph; from:Vertex; to:Vertex; directed:bool):NOT__MANAGED =
  var eids:Edge_indices

  var ret = igraph_get_all_eids_between(graph.handle.addr, eids.addr, from, to, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (eids.NOT__MANAGED)

proc incident*(graph:Graph; vid:Vertex; mode:Neimode):NOT__MANAGED =
  var eids:Edge_indices

  var ret = igraph_incident(graph.handle.addr, eids.addr, vid, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (eids.NOT__MANAGED)

proc isSameGraph*(graph1:Graph; graph2:Graph):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_same_graph(graph1.handle.addr, graph2.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc create*(edges:Vector_int; n:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_create(result.handle.addr, edges, n, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc adjacency*(adjmatrix:Matrix; mode:Adjacency_mode; loops:Loops):Graph =
  result = new Graph
  var ret = igraph_adjacency(result.handle.addr, adjmatrix, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc sparseAdjacency*(mode:Adjacency_mode; loops:Loops):tuple[graph:Graph; adjmatrix:NOT__MANAGED] =
  result = new Graph  var adjmatrix:Sparsemat

  var ret = igraph_sparse_adjacency(result.handle.addr, adjmatrix.addr, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (adjmatrix.NOT__MANAGED)

proc sparseAdjacency*(adjmatrix:Sparsemat; mode:Adjacency_mode; loops:Loops):Graph =
  result = new Graph
  var ret = igraph_sparse_adjacency(result.handle.addr, adjmatrix, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc sparseWeightedAdjacency*(mode:Adjacency_mode; loops:Loops):tuple[graph:Graph; adjmatrix:NOT__MANAGED; weights:NOT__MANAGED] =
  result = new Graph  var adjmatrix:Sparsemat
  var weights:Edgeweights

  var ret = igraph_sparse_weighted_adjacency(result.handle.addr, adjmatrix.addr, mode, weights.addr, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (adjmatrix.NOT__MANAGED, weights.NOT__MANAGED)

proc sparseWeightedAdjacency*(adjmatrix:Sparsemat; mode:Adjacency_mode; loops:Loops):tuple[graph:Graph; weights:NOT__MANAGED] =
  result = new Graph  var weights:Edgeweights

  var ret = igraph_sparse_weighted_adjacency(result.handle.addr, adjmatrix, mode, weights.addr, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (weights.NOT__MANAGED)

proc weightedAdjacency*(adjmatrix:Matrix; mode:Adjacency_mode; loops:Loops):tuple[graph:Graph; weights:NOT__MANAGED] =
  result = new Graph  var weights:Edgeweights

  var ret = igraph_weighted_adjacency(result.handle.addr, adjmatrix, mode, weights.addr, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (weights.NOT__MANAGED)

proc star*(n:int; mode:Star_mode; center:int):Graph =
  result = new Graph
  var ret = igraph_star(result.handle.addr, n, mode, center)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc wheel*(n:int; mode:Wheel_mode; center:int):Graph =
  result = new Graph
  var ret = igraph_wheel(result.handle.addr, n, mode, center)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc hypercube*(n:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_hypercube(result.handle.addr, n, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc squareLattice*(dimvector:Vector_int; nei:int; directed:bool; mutual:bool; periodic:Vector_bool):Graph =
  result = new Graph
  var ret = igraph_square_lattice(result.handle.addr, dimvector, nei, directed, mutual, periodic)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc triangularLattice*(dimvector:Vector_int; directed:bool; mutual:bool):Graph =
  result = new Graph
  var ret = igraph_triangular_lattice(result.handle.addr, dimvector, directed, mutual)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc ring*(n:int; directed:bool; mutual:bool; circular:bool):Graph =
  result = new Graph
  var ret = igraph_ring(result.handle.addr, n, directed, mutual, circular)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc karyTree*(n:int; children:int; type:Tree_mode):Graph =
  result = new Graph
  var ret = igraph_kary_tree(result.handle.addr, n, children, type)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc symmetricTree*(branches:Vector_int; type:Tree_mode):Graph =
  result = new Graph
  var ret = igraph_symmetric_tree(result.handle.addr, branches, type)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc regularTree*(h:int; k:int; type:Tree_mode):Graph =
  result = new Graph
  var ret = igraph_regular_tree(result.handle.addr, h, k, type)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc full*(n:int; directed:bool; loops:bool):Graph =
  result = new Graph
  var ret = igraph_full(result.handle.addr, n, directed, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc fullCitation*(n:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_full_citation(result.handle.addr, n, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc atlas*(number:int):Graph =
  result = new Graph
  var ret = igraph_atlas(result.handle.addr, number)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc extendedChordalRing*(nodes:int; W:Matrix_int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_extended_chordal_ring(result.handle.addr, nodes, W, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc connectNeighborhood*(order:int; mode:Neimode):Graph =
  result = new Graph
  var ret = igraph_connect_neighborhood(result.handle.addr, order, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc connectNeighborhood*(graph:Graph; order:int; mode:Neimode) =
  var ret = igraph_connect_neighborhood(graph.handle.addr, order, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc graphPower*(graph:Graph; order:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_graph_power(graph.handle.addrresult.handle.addr, order, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc linegraph*(graph:Graph):Graph =
  result = new Graph
  var ret = igraph_linegraph(graph.handle.addrresult.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc deBruijn*(m:int; n:int):Graph =
  result = new Graph
  var ret = igraph_de_bruijn(result.handle.addr, m, n)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc kautz*(m:int; n:int):Graph =
  result = new Graph
  var ret = igraph_kautz(result.handle.addr, m, n)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc famous*(name:cstring):Graph =
  result = new Graph
  var ret = igraph_famous(result.handle.addr, name)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc lcfVector*(n:int; shifts:Vector_int; repeats:int):Graph =
  result = new Graph
  var ret = igraph_lcf_vector(result.handle.addr, n, shifts, repeats)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc adjlist*(adjlist:Adjlist; mode:Neimode; duplicate:bool):Graph =
  result = new Graph
  var ret = igraph_adjlist(result.handle.addr, adjlist, mode, duplicate)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc fullBipartite*(n1:int; n2:int; directed:bool; mode:Neimode):tuple[graph:Graph; types:NOT__MANAGED] =
  result = new Graph  var types:Bipartite_types

  var ret = igraph_full_bipartite(result.handle.addr, types.addr, n1, n2, directed, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (types.NOT__MANAGED)

proc fullMultipartite*(n:Vector_int; directed:bool; mode:Neimode):tuple[graph:Graph; types:NOT__MANAGED] =
  result = new Graph  var types:Index_vector

  var ret = igraph_full_multipartite(result.handle.addr, types.addr, n, directed, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (types.NOT__MANAGED)

proc realizeDegreeSequence*(out_deg:Vector_int; in_deg:Vector_int; allowed_edge_types:Edge_type_sw; method:Realize_degseq_method):Graph =
  result = new Graph
  var ret = igraph_realize_degree_sequence(result.handle.addr, out_deg, in_deg, allowed_edge_types, method)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc realizeBipartiteDegreeSequence*(degrees1:Vector_int; degrees2:Vector_int; allowed_edge_types:Edge_type_sw; method:Realize_degseq_method):Graph =
  result = new Graph
  var ret = igraph_realize_bipartite_degree_sequence(result.handle.addr, degrees1, degrees2, allowed_edge_types, method)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc circulant*(n:int; shifts:Vector_int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_circulant(result.handle.addr, n, shifts, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc generalizedPetersen*(n:int; k:int):Graph =
  result = new Graph
  var ret = igraph_generalized_petersen(result.handle.addr, n, k)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc turan*(n:int; r:int):tuple[graph:Graph; types:NOT__MANAGED] =
  result = new Graph  var types:Index_vector

  var ret = igraph_turan(result.handle.addr, types.addr, n, r)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (types.NOT__MANAGED)

proc weightedSparsemat*(A:Sparsemat; directed:bool; attr:cstring; loops:bool):Graph =
  result = new Graph
  var ret = igraph_weighted_sparsemat(result.handle.addr, A, directed, attr, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc barabasiGame*(n:int; power:float; m:int; outseq:Vector_int; outpref:bool; A:float; directed:bool; algo:Barabasi_algorithm; start_from:Graph):Graph =
  result = new Graph
  var ret = igraph_barabasi_game(result.handle.addr, n, power, m, outseq, outpref, A, directed, algo, start_from.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc erdosRenyiGameGnp*(n:int; p:float; directed:bool; loops:bool):Graph =
  result = new Graph
  var ret = igraph_erdos_renyi_game_gnp(result.handle.addr, n, p, directed, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc erdosRenyiGameGnm*(n:int; m:int; directed:bool; loops:bool):Graph =
  result = new Graph
  var ret = igraph_erdos_renyi_game_gnm(result.handle.addr, n, m, directed, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc degreeSequenceGame*(out_deg:Vector_int; in_deg:Vector_int; method:Degseq_mode):Graph =
  result = new Graph
  var ret = igraph_degree_sequence_game(result.handle.addr, out_deg, in_deg, method)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc growingRandomGame*(n:int; m:int; directed:bool; citation:bool):Graph =
  result = new Graph
  var ret = igraph_growing_random_game(result.handle.addr, n, m, directed, citation)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc barabasiAgingGame*(nodes:int; m:int; outseq:Vector_int; outpref:bool; pa_exp:float; aging_exp:float; aging_bin:int; zero_deg_appeal:float; zero_age_appeal:float; deg_coef:float; age_coef:float; directed:bool):Graph =
  result = new Graph
  var ret = igraph_barabasi_aging_game(result.handle.addr, nodes, m, outseq, outpref, pa_exp, aging_exp, aging_bin, zero_deg_appeal, zero_age_appeal, deg_coef, age_coef, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc recentDegreeGame*(n:int; power:float; window:int; m:int; outseq:Vector_int; outpref:bool; zero_appeal:float; directed:bool):Graph =
  result = new Graph
  var ret = igraph_recent_degree_game(result.handle.addr, n, power, window, m, outseq, outpref, zero_appeal, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc recentDegreeAgingGame*(nodes:int; m:int; outseq:Vector_int; outpref:bool; pa_exp:float; aging_exp:float; aging_bin:int; window:int; zero_appeal:float; directed:bool):Graph =
  result = new Graph
  var ret = igraph_recent_degree_aging_game(result.handle.addr, nodes, m, outseq, outpref, pa_exp, aging_exp, aging_bin, window, zero_appeal, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc callawayTraitsGame*(nodes:int; types:int; edges_per_step:int; type_dist:Vector; pref_matrix:Matrix; directed:bool):tuple[graph:Graph; node_type_vec:NOT__MANAGED] =
  result = new Graph  var node_type_vec:Vector_int

  var ret = igraph_callaway_traits_game(result.handle.addr, nodes, types, edges_per_step, type_dist, pref_matrix, directed, node_type_vec.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (node_type_vec.NOT__MANAGED)

proc establishmentGame*(nodes:int; types:int; k:int; type_dist:Vector; pref_matrix:Matrix; directed:bool):tuple[graph:Graph; node_type_vec:NOT__MANAGED] =
  result = new Graph  var node_type_vec:Vector_int

  var ret = igraph_establishment_game(result.handle.addr, nodes, types, k, type_dist, pref_matrix, directed, node_type_vec.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (node_type_vec.NOT__MANAGED)

proc grgGame*(nodes:int; radius:float; torus:bool):tuple[graph:Graph; x:NOT__MANAGED; y:NOT__MANAGED] =
  result = new Graph  var x:Vector
  var y:Vector

  var ret = igraph_grg_game(result.handle.addr, nodes, radius, torus, x.addr, y.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (x.NOT__MANAGED, y.NOT__MANAGED)

proc preferenceGame*(nodes:int; types:int; type_dist:Vector; fixed_sizes:bool; pref_matrix:Matrix; directed:bool; loops:bool):tuple[graph:Graph; node_type_vec:NOT__MANAGED] =
  result = new Graph  var node_type_vec:Vector_int

  var ret = igraph_preference_game(result.handle.addr, nodes, types, type_dist, fixed_sizes, pref_matrix, node_type_vec.addr, directed, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (node_type_vec.NOT__MANAGED)

proc asymmetricPreferenceGame*(nodes:int; out_types:int; in_types:int; type_dist_matrix:Matrix; pref_matrix:Matrix; loops:bool):tuple[graph:Graph; node_type_out_vec:NOT__MANAGED; node_type_in_vec:NOT__MANAGED] =
  result = new Graph  var node_type_out_vec:Vector_int
  var node_type_in_vec:Vector_int

  var ret = igraph_asymmetric_preference_game(result.handle.addr, nodes, out_types, in_types, type_dist_matrix, pref_matrix, node_type_out_vec.addr, node_type_in_vec.addr, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (node_type_out_vec.NOT__MANAGED, node_type_in_vec.NOT__MANAGED)

proc rewireEdges*(prob:float; loops:bool; multiple:bool):Graph =
  result = new Graph
  var ret = igraph_rewire_edges(result.handle.addr, prob, loops, multiple)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc rewireEdges*(graph:Graph; prob:float; loops:bool; multiple:bool) =
  var ret = igraph_rewire_edges(graph.handle.addr, prob, loops, multiple)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc rewireDirectedEdges*(prob:float; loops:bool; mode:Neimode):Graph =
  result = new Graph
  var ret = igraph_rewire_directed_edges(result.handle.addr, prob, loops, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc rewireDirectedEdges*(graph:Graph; prob:float; loops:bool; mode:Neimode) =
  var ret = igraph_rewire_directed_edges(graph.handle.addr, prob, loops, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc wattsStrogatzGame*(dim:int; size:int; nei:int; p:float; loops:bool; multiple:bool):Graph =
  result = new Graph
  var ret = igraph_watts_strogatz_game(result.handle.addr, dim, size, nei, p, loops, multiple)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc lastcitGame*(nodes:int; edges_per_node:int; agebins:int; preference:Vector; directed:bool):Graph =
  result = new Graph
  var ret = igraph_lastcit_game(result.handle.addr, nodes, edges_per_node, agebins, preference, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc citedTypeGame*(nodes:int; types:Index_vector; pref:Vector; edges_per_step:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_cited_type_game(result.handle.addr, nodes, types, pref, edges_per_step, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc citingCitedTypeGame*(nodes:int; types:Index_vector; pref:Matrix; edges_per_step:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_citing_cited_type_game(result.handle.addr, nodes, types, pref, edges_per_step, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc forestFireGame*(nodes:int; fw_prob:float; bw_factor:float; ambs:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_forest_fire_game(result.handle.addr, nodes, fw_prob, bw_factor, ambs, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc simpleInterconnectedIslandsGame*(islands_n:int; islands_size:int; islands_pin:float; n_inter:int):Graph =
  result = new Graph
  var ret = igraph_simple_interconnected_islands_game(result.handle.addr, islands_n, islands_size, islands_pin, n_inter)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc chungLuGame*(expected_out_deg:Vector; expected_in_deg:Vector; loops:bool; variant:Chung_lu_variant):Graph =
  result = new Graph
  var ret = igraph_chung_lu_game(result.handle.addr, expected_out_deg, expected_in_deg, loops, variant)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc staticFitnessGame*(no_of_edges:int; fitness_out:Vector; fitness_in:Vector; loops:bool; multiple:bool):Graph =
  result = new Graph
  var ret = igraph_static_fitness_game(result.handle.addr, no_of_edges, fitness_out, fitness_in, loops, multiple)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc staticPowerLawGame*(no_of_nodes:int; no_of_edges:int; exponent_out:float; exponent_in:float; loops:bool; multiple:bool; finite_size_correction:bool):Graph =
  result = new Graph
  var ret = igraph_static_power_law_game(result.handle.addr, no_of_nodes, no_of_edges, exponent_out, exponent_in, loops, multiple, finite_size_correction)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc kRegularGame*(no_of_nodes:int; k:int; directed:bool; multiple:bool):Graph =
  result = new Graph
  var ret = igraph_k_regular_game(result.handle.addr, no_of_nodes, k, directed, multiple)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc sbmGame*(n:int; pref_matrix:Matrix; block_sizes:Vector_int; directed:bool; loops:bool):Graph =
  result = new Graph
  var ret = igraph_sbm_game(result.handle.addr, n, pref_matrix, block_sizes, directed, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc hsbmGame*(n:int; m:int; rho:Vector; C:Matrix; p:float):Graph =
  result = new Graph
  var ret = igraph_hsbm_game(result.handle.addr, n, m, rho, C, p)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc hsbmListGame*(n:int; mlist:Vector_int; rholist:Vector_list; Clist:Matrix_list; p:float):Graph =
  result = new Graph
  var ret = igraph_hsbm_list_game(result.handle.addr, n, mlist, rholist, Clist, p)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc correlatedGame*(old_graph:Graph; corr:float; p:float; permutation:Index_vector):Graph =
  result = new Graph
  var ret = igraph_correlated_game(old_graph.handle.addrresult.handle.addr, corr, p, permutation)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc correlatedPairGame*(n:int; corr:float; p:float; directed:bool; permutation:Index_vector):tuple[graph1:Graph; graph2:Graph] =
  result = new Graph
  var ret = igraph_correlated_pair_game(result.handle.addrresult.handle.addr, n, corr, p, directed, permutation)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc dotProductGame*(vecs:Matrix; directed:bool):Graph =
  result = new Graph
  var ret = igraph_dot_product_game(result.handle.addr, vecs, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc sampleSphereSurface*(dim:int; n:int; radius:float; positive:bool):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_sample_sphere_surface(dim, n, radius, positive, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc sampleSphereVolume*(dim:int; n:int; radius:float; positive:bool):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_sample_sphere_volume(dim, n, radius, positive, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc sampleDirichlet*(n:int; alpha:Vector):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_sample_dirichlet(n, alpha, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc areAdjacent*(graph:Graph; v1:Vertex; v2:Vertex):NOT__MANAGED =
  var res:bool

  var ret = igraph_are_adjacent(graph.handle.addr, v1, v2, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc areConnected*(graph:Graph; v1:Vertex; v2:Vertex):NOT__MANAGED =
  var res:bool

  var ret = igraph_are_connected(graph.handle.addr, v1, v2, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc diameter*(graph:Graph; directed:bool; unconnected:bool):tuple[res:NOT__MANAGED; from:NOT__MANAGED; to:NOT__MANAGED; vertex_path:NOT__MANAGED; edge_path:NOT__MANAGED] =
  var res:float
  var from:int
  var to:int
  var vertex_path:Vector_int
  var edge_path:Vector_int

  var ret = igraph_diameter(graph.handle.addr, res.addr, from.addr, to.addr, vertex_path.addr, edge_path.addr, directed, unconnected)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, from.NOT__MANAGED, to.NOT__MANAGED, vertex_path.NOT__MANAGED, edge_path.NOT__MANAGED)

proc diameterDijkstra*(graph:Graph; weights:Edgeweights; directed:bool; unconnected:bool):tuple[res:NOT__MANAGED; from:NOT__MANAGED; to:NOT__MANAGED; vertex_path:NOT__MANAGED; edge_path:NOT__MANAGED] =
  var res:float
  var from:int
  var to:int
  var vertex_path:Vector_int
  var edge_path:Vector_int

  var ret = igraph_diameter_dijkstra(graph.handle.addr, weights, res.addr, from.addr, to.addr, vertex_path.addr, edge_path.addr, directed, unconnected)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, from.NOT__MANAGED, to.NOT__MANAGED, vertex_path.NOT__MANAGED, edge_path.NOT__MANAGED)

proc closeness*(graph:Graph; vids:Vertex_selector; mode:Neimode; weights:Edgeweights; normalized:bool):tuple[res:NOT__MANAGED; reachable_count:NOT__MANAGED; all_reachable:NOT__MANAGED] =
  var res:Vertex_qty
  var reachable_count:Vector_int
  var all_reachable:bool

  var ret = igraph_closeness(graph.handle.addr, res.addr, reachable_count.addr, all_reachable.addr, vids, mode, weights, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, reachable_count.NOT__MANAGED, all_reachable.NOT__MANAGED)

proc closenessCutoff*(graph:Graph; vids:Vertex_selector; mode:Neimode; weights:Edgeweights; normalized:bool; cutoff:float):tuple[res:NOT__MANAGED; reachable_count:NOT__MANAGED; all_reachable:NOT__MANAGED] =
  var res:Vertex_qty
  var reachable_count:Vector_int
  var all_reachable:bool

  var ret = igraph_closeness_cutoff(graph.handle.addr, res.addr, reachable_count.addr, all_reachable.addr, vids, mode, weights, normalized, cutoff)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, reachable_count.NOT__MANAGED, all_reachable.NOT__MANAGED)

proc distances*(graph:Graph; from:Vertex_selector; to:Vertex_selector; mode:Neimode):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_distances(graph.handle.addr, res.addr, from, to, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc distancesCutoff*(graph:Graph; from:Vertex_selector; to:Vertex_selector; mode:Neimode; cutoff:float):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_distances_cutoff(graph.handle.addr, res.addr, from, to, mode, cutoff)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc getShortestPath*(graph:Graph; from:Vertex; to:Vertex; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED] =
  var vertices:Vertex_indices
  var edges:Edge_indices

  var ret = igraph_get_shortest_path(graph.handle.addr, vertices.addr, edges.addr, from, to, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED)

proc getShortestPathBellmanFord*(graph:Graph; from:Vertex; to:Vertex; weights:Edgeweights; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED] =
  var vertices:Vertex_indices
  var edges:Edge_indices

  var ret = igraph_get_shortest_path_bellman_ford(graph.handle.addr, vertices.addr, edges.addr, from, to, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED)

proc getShortestPathDijkstra*(graph:Graph; from:Vertex; to:Vertex; weights:Edgeweights; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED] =
  var vertices:Vertex_indices
  var edges:Edge_indices

  var ret = igraph_get_shortest_path_dijkstra(graph.handle.addr, vertices.addr, edges.addr, from, to, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED)

proc getShortestPathAstar*(graph:Graph; from:Vertex; to:Vertex; weights:Edgeweights; mode:Neimode; heuristic:Astar_heuristic_func; extra:Extra):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED] =
  var vertices:Vertex_indices
  var edges:Edge_indices

  var ret = igraph_get_shortest_path_astar(graph.handle.addr, vertices.addr, edges.addr, from, to, weights, mode, heuristic, extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED)

proc getShortestPaths*(graph:Graph; from:Vertex; to:Vertex_selector; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED; parents:NOT__MANAGED; inbound_edges:NOT__MANAGED] =
  var vertices:Vertexset_list
  var edges:Edgeset_list
  var parents:Vector_int
  var inbound_edges:Vector_int

  var ret = igraph_get_shortest_paths(graph.handle.addr, vertices.addr, edges.addr, from, to, mode, parents.addr, inbound_edges.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED, parents.NOT__MANAGED, inbound_edges.NOT__MANAGED)

proc getAllShortestPaths*(graph:Graph; from:Vertex; to:Vertex_selector; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED; nrgeo:NOT__MANAGED] =
  var vertices:Vertexset_list
  var edges:Edgeset_list
  var nrgeo:Vector_int

  var ret = igraph_get_all_shortest_paths(graph.handle.addr, vertices.addr, edges.addr, nrgeo.addr, from, to, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED, nrgeo.NOT__MANAGED)

proc distancesDijkstra*(graph:Graph; from:Vertex_selector; to:Vertex_selector; weights:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_distances_dijkstra(graph.handle.addr, res.addr, from, to, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc distancesDijkstraCutoff*(graph:Graph; from:Vertex_selector; to:Vertex_selector; weights:Edgeweights; mode:Neimode; cutoff:float):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_distances_dijkstra_cutoff(graph.handle.addr, res.addr, from, to, weights, mode, cutoff)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc getShortestPathsDijkstra*(graph:Graph; from:Vertex; to:Vertex_selector; weights:Edgeweights; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED; parents:NOT__MANAGED; inbound_edges:NOT__MANAGED] =
  var vertices:Vertexset_list
  var edges:Edgeset_list
  var parents:Vector_int
  var inbound_edges:Vector_int

  var ret = igraph_get_shortest_paths_dijkstra(graph.handle.addr, vertices.addr, edges.addr, from, to, weights, mode, parents.addr, inbound_edges.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED, parents.NOT__MANAGED, inbound_edges.NOT__MANAGED)

proc getShortestPathsBellmanFord*(graph:Graph; from:Vertex; to:Vertex_selector; weights:Edgeweights; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED; parents:NOT__MANAGED; inbound_edges:NOT__MANAGED] =
  var vertices:Vertexset_list
  var edges:Edgeset_list
  var parents:Vector_int
  var inbound_edges:Vector_int

  var ret = igraph_get_shortest_paths_bellman_ford(graph.handle.addr, vertices.addr, edges.addr, from, to, weights, mode, parents.addr, inbound_edges.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED, parents.NOT__MANAGED, inbound_edges.NOT__MANAGED)

proc getAllShortestPathsDijkstra*(graph:Graph; from:Vertex; to:Vertex_selector; weights:Edgeweights; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED; nrgeo:NOT__MANAGED] =
  var vertices:Vertexset_list
  var edges:Edgeset_list
  var nrgeo:Vector_int

  var ret = igraph_get_all_shortest_paths_dijkstra(graph.handle.addr, vertices.addr, edges.addr, nrgeo.addr, from, to, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED, nrgeo.NOT__MANAGED)

proc distancesBellmanFord*(graph:Graph; from:Vertex_selector; to:Vertex_selector; weights:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_distances_bellman_ford(graph.handle.addr, res.addr, from, to, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc distancesJohnson*(graph:Graph; from:Vertex_selector; to:Vertex_selector; weights:Edgeweights):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_distances_johnson(graph.handle.addr, res.addr, from, to, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc distancesFloydWarshall*(graph:Graph; from:Vertex_selector; to:Vertex_selector; weights:Edgeweights; mode:Neimode; method:Fwalgorithm):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_distances_floyd_warshall(graph.handle.addr, res.addr, from, to, weights, mode, method)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc voronoi*(graph:Graph; generators:Vertex_indices; weights:Edgeweights; mode:Neimode; tiebreaker:Voronoi_tiebreaker):tuple[membership:NOT__MANAGED; distances:NOT__MANAGED] =
  var membership:Vector_int
  var distances:Vector

  var ret = igraph_voronoi(graph.handle.addr, membership.addr, distances.addr, generators, weights, mode, tiebreaker)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED, distances.NOT__MANAGED)

proc getAllSimplePaths*(graph:Graph; from:Vertex; to:Vertex_selector; cutoff:int; mode:Neimode):NOT__MANAGED =
  var res:Vertex_indices

  var ret = igraph_get_all_simple_paths(graph.handle.addr, res.addr, from, to, cutoff, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc getKShortestPaths*(graph:Graph; weights:Edgeweights; k:int; from:Vertex; to:Vertex; mode:Neimode):tuple[vertex_paths:NOT__MANAGED; edge_paths:NOT__MANAGED] =
  var vertex_paths:Vertexset_list
  var edge_paths:Edgeset_list

  var ret = igraph_get_k_shortest_paths(graph.handle.addr, weights, vertex_paths.addr, edge_paths.addr, k, from, to, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertex_paths.NOT__MANAGED, edge_paths.NOT__MANAGED)

proc getWidestPath*(graph:Graph; from:Vertex; to:Vertex; weights:Edgeweights; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED] =
  var vertices:Vertex_indices
  var edges:Edge_indices

  var ret = igraph_get_widest_path(graph.handle.addr, vertices.addr, edges.addr, from, to, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED)

proc getWidestPaths*(graph:Graph; from:Vertex; to:Vertex_selector; weights:Edgeweights; mode:Neimode):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED; parents:NOT__MANAGED; inbound_edges:NOT__MANAGED] =
  var vertices:Vertexset_list
  var edges:Edgeset_list
  var parents:Vector_int
  var inbound_edges:Vector_int

  var ret = igraph_get_widest_paths(graph.handle.addr, vertices.addr, edges.addr, from, to, weights, mode, parents.addr, inbound_edges.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED, parents.NOT__MANAGED, inbound_edges.NOT__MANAGED)

proc widestPathWidthsDijkstra*(graph:Graph; from:Vertex_selector; to:Vertex_selector; weights:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_widest_path_widths_dijkstra(graph.handle.addr, res.addr, from, to, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc widestPathWidthsFloydWarshall*(graph:Graph; from:Vertex_selector; to:Vertex_selector; weights:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_widest_path_widths_floyd_warshall(graph.handle.addr, res.addr, from, to, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc spanner*(graph:Graph; stretch:float; weights:Edgeweights):NOT__MANAGED =
  var spanner:Edge_indices

  var ret = igraph_spanner(graph.handle.addr, spanner.addr, stretch, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (spanner.NOT__MANAGED)

proc subcomponent*(graph:Graph; vid:Vertex; mode:Neimode):NOT__MANAGED =
  var res:Vertex_indices

  var ret = igraph_subcomponent(graph.handle.addr, res.addr, vid, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc betweenness*(graph:Graph; vids:Vertex_selector; directed:bool; weights:Edgeweights):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_betweenness(graph.handle.addr, res.addr, vids, directed, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc betweennessCutoff*(graph:Graph; vids:Vertex_selector; directed:bool; weights:Edgeweights; cutoff:float):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_betweenness_cutoff(graph.handle.addr, res.addr, vids, directed, weights, cutoff)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc betweennessSubset*(graph:Graph; vids:Vertex_selector; directed:bool; sources:Vertex_selector; targets:Vertex_selector; weights:Edgeweights):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_betweenness_subset(graph.handle.addr, res.addr, vids, directed, sources, targets, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc edgeBetweenness*(graph:Graph; directed:bool; weights:Edgeweights):NOT__MANAGED =
  var res:Vector

  var ret = igraph_edge_betweenness(graph.handle.addr, res.addr, directed, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc edgeBetweennessCutoff*(graph:Graph; directed:bool; weights:Edgeweights; cutoff:float):NOT__MANAGED =
  var res:Vector

  var ret = igraph_edge_betweenness_cutoff(graph.handle.addr, res.addr, directed, weights, cutoff)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc edgeBetweennessSubset*(graph:Graph; eids:Edge_selector; directed:bool; sources:Vertex_selector; targets:Vertex_selector; weights:Edgeweights):NOT__MANAGED =
  var res:Vector

  var ret = igraph_edge_betweenness_subset(graph.handle.addr, res.addr, eids, directed, sources, targets, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc harmonicCentrality*(graph:Graph; vids:Vertex_selector; mode:Neimode; weights:Edgeweights; normalized:bool):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_harmonic_centrality(graph.handle.addr, res.addr, vids, mode, weights, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc harmonicCentralityCutoff*(graph:Graph; vids:Vertex_selector; mode:Neimode; weights:Edgeweights; normalized:bool; cutoff:float):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_harmonic_centrality_cutoff(graph.handle.addr, res.addr, vids, mode, weights, normalized, cutoff)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc pagerank*(graph:Graph; algo:Pagerankalgo; vids:Vertex_selector; directed:bool; damping:float; weights:Edgeweights):tuple[vector:NOT__MANAGED; value:NOT__MANAGED; options:NOT__MANAGED] =
  var vector:Vertex_qty
  var value:float
  var options:Pagerankopt

  var ret = igraph_pagerank(graph.handle.addr, algo, vector.addr, value.addr, vids, directed, damping, weights, options.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED, options.NOT__MANAGED)

proc pagerank*(graph:Graph; algo:Pagerankalgo; vids:Vertex_selector; directed:bool; damping:float; weights:Edgeweights; options:Pagerankopt):tuple[vector:NOT__MANAGED; value:NOT__MANAGED] =
  var vector:Vertex_qty
  var value:float

  var ret = igraph_pagerank(graph.handle.addr, algo, vector.addr, value.addr, vids, directed, damping, weights, options)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED)

proc personalizedPagerank*(graph:Graph; algo:Pagerankalgo; vids:Vertex_selector; directed:bool; damping:float; personalized:Vector; weights:Edgeweights):tuple[vector:NOT__MANAGED; value:NOT__MANAGED; options:NOT__MANAGED] =
  var vector:Vertex_qty
  var value:float
  var options:Pagerankopt

  var ret = igraph_personalized_pagerank(graph.handle.addr, algo, vector.addr, value.addr, vids, directed, damping, personalized, weights, options.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED, options.NOT__MANAGED)

proc personalizedPagerank*(graph:Graph; algo:Pagerankalgo; vids:Vertex_selector; directed:bool; damping:float; personalized:Vector; weights:Edgeweights; options:Pagerankopt):tuple[vector:NOT__MANAGED; value:NOT__MANAGED] =
  var vector:Vertex_qty
  var value:float

  var ret = igraph_personalized_pagerank(graph.handle.addr, algo, vector.addr, value.addr, vids, directed, damping, personalized, weights, options)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED)

proc personalizedPagerankVs*(graph:Graph; algo:Pagerankalgo; vids:Vertex_selector; directed:bool; damping:float; reset_vids:Vertex_selector; weights:Edgeweights):tuple[vector:NOT__MANAGED; value:NOT__MANAGED; options:NOT__MANAGED] =
  var vector:Vertex_qty
  var value:float
  var options:Pagerankopt

  var ret = igraph_personalized_pagerank_vs(graph.handle.addr, algo, vector.addr, value.addr, vids, directed, damping, reset_vids, weights, options.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED, options.NOT__MANAGED)

proc personalizedPagerankVs*(graph:Graph; algo:Pagerankalgo; vids:Vertex_selector; directed:bool; damping:float; reset_vids:Vertex_selector; weights:Edgeweights; options:Pagerankopt):tuple[vector:NOT__MANAGED; value:NOT__MANAGED] =
  var vector:Vertex_qty
  var value:float

  var ret = igraph_personalized_pagerank_vs(graph.handle.addr, algo, vector.addr, value.addr, vids, directed, damping, reset_vids, weights, options)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED)

proc rewire*(n:int; mode:Rewiring_mode):Graph =
  result = new Graph
  var ret = igraph_rewire(result.handle.addr, n, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc rewire*(rewire:Graph; n:int; mode:Rewiring_mode) =
  var ret = igraph_rewire(rewire.handle.addr, n, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc inducedSubgraph*(graph:Graph; vids:Vertex_selector; impl:Subgraph_impl):Graph =
  result = new Graph
  var ret = igraph_induced_subgraph(graph.handle.addrresult.handle.addr, vids, impl)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc subgraphFromEdges*(graph:Graph; eids:Edge_selector; delete_vertices:bool):Graph =
  result = new Graph
  var ret = igraph_subgraph_from_edges(graph.handle.addrresult.handle.addr, eids, delete_vertices)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc reverseEdges*(eids:Edge_selector):Graph =
  result = new Graph
  var ret = igraph_reverse_edges(result.handle.addr, eids)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc reverseEdges*(graph:Graph; eids:Edge_selector) =
  var ret = igraph_reverse_edges(graph.handle.addr, eids)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc averagePathLength*(graph:Graph; directed:bool; unconn:bool):tuple[res:NOT__MANAGED; unconn_pairs:NOT__MANAGED] =
  var res:float
  var unconn_pairs:float

  var ret = igraph_average_path_length(graph.handle.addr, res.addr, unconn_pairs.addr, directed, unconn)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, unconn_pairs.NOT__MANAGED)

proc averagePathLengthDijkstra*(graph:Graph; weights:Edgeweights; directed:bool; unconn:bool):tuple[res:NOT__MANAGED; unconn_pairs:NOT__MANAGED] =
  var res:float
  var unconn_pairs:float

  var ret = igraph_average_path_length_dijkstra(graph.handle.addr, res.addr, unconn_pairs.addr, weights, directed, unconn)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, unconn_pairs.NOT__MANAGED)

proc pathLengthHist*(graph:Graph; directed:bool):tuple[res:NOT__MANAGED; unconnected:NOT__MANAGED] =
  var res:Vector
  var unconnected:float

  var ret = igraph_path_length_hist(graph.handle.addr, res.addr, unconnected.addr, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, unconnected.NOT__MANAGED)

proc simplify*(remove_multiple:bool; remove_loops:bool; edge_attr_comb:Edge_attribute_combination):Graph =
  result = new Graph
  var ret = igraph_simplify(result.handle.addr, remove_multiple, remove_loops, edge_attr_comb)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc simplify*(graph:Graph; remove_multiple:bool; remove_loops:bool; edge_attr_comb:Edge_attribute_combination) =
  var ret = igraph_simplify(graph.handle.addr, remove_multiple, remove_loops, edge_attr_comb)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc transitivityUndirected*(graph:Graph; mode:Transitivity_mode):NOT__MANAGED =
  var res:float

  var ret = igraph_transitivity_undirected(graph.handle.addr, res.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc transitivityLocalUndirected*(graph:Graph; vids:Vertex_selector; mode:Transitivity_mode):NOT__MANAGED =
  var res:Vector

  var ret = igraph_transitivity_local_undirected(graph.handle.addr, res.addr, vids, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc transitivityAvglocalUndirected*(graph:Graph; mode:Transitivity_mode):NOT__MANAGED =
  var res:float

  var ret = igraph_transitivity_avglocal_undirected(graph.handle.addr, res.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc transitivityBarrat*(graph:Graph; vids:Vertex_selector; weights:Edgeweights; mode:Transitivity_mode):NOT__MANAGED =
  var res:Vector

  var ret = igraph_transitivity_barrat(graph.handle.addr, res.addr, vids, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc ecc*(graph:Graph; eids:Edge_selector; k:int; offset:bool; normalize:bool):NOT__MANAGED =
  var res:Vector

  var ret = igraph_ecc(graph.handle.addr, res.addr, eids, k, offset, normalize)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc reciprocity*(graph:Graph; ignore_loops:bool; mode:Recip):NOT__MANAGED =
  var res:float

  var ret = igraph_reciprocity(graph.handle.addr, res.addr, ignore_loops, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc constraint*(graph:Graph; vids:Vertex_selector; weights:Edgeweights):NOT__MANAGED =
  var res:Vector

  var ret = igraph_constraint(graph.handle.addr, res.addr, vids, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc maxdegree*(graph:Graph; vids:Vertex_selector; mode:Neimode; loops:bool):NOT__MANAGED =
  var res:int

  var ret = igraph_maxdegree(graph.handle.addr, res.addr, vids, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc density*(graph:Graph; loops:bool):NOT__MANAGED =
  var res:float

  var ret = igraph_density(graph.handle.addr, res.addr, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc meanDegree*(graph:Graph; loops:bool):NOT__MANAGED =
  var res:float

  var ret = igraph_mean_degree(graph.handle.addr, res.addr, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc neighborhoodSize*(graph:Graph; vids:Vertex_selector; order:int; mode:Neimode; mindist:int):NOT__MANAGED =
  var res:Vector_int

  var ret = igraph_neighborhood_size(graph.handle.addr, res.addr, vids, order, mode, mindist)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc neighborhood*(graph:Graph; vids:Vertex_selector; order:int; mode:Neimode; mindist:int):NOT__MANAGED =
  var res:Vertexset_list

  var ret = igraph_neighborhood(graph.handle.addr, res.addr, vids, order, mode, mindist)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc neighborhoodGraphs*(graph:Graph; vids:Vertex_selector; order:int; mode:Neimode; mindist:int):NOT__MANAGED =
  var res:Graph_list

  var ret = igraph_neighborhood_graphs(graph.handle.addr, res.addr, vids, order, mode, mindist)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc topologicalSorting*(graph:Graph; mode:Neimode):NOT__MANAGED =
  var res:Vector_int

  var ret = igraph_topological_sorting(graph.handle.addr, res.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc feedbackArcSet*(graph:Graph; weights:Edgeweights; algo:Fas_algorithm):NOT__MANAGED =
  var result:Edge_indices

  var ret = igraph_feedback_arc_set(graph.handle.addr, result.addr, weights, algo)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (result.NOT__MANAGED)

proc isLoop*(graph:Graph; es:Edge_selector):NOT__MANAGED =
  var res:Vector_bool

  var ret = igraph_is_loop(graph.handle.addr, res.addr, es)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc isDag*(graph:Graph):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_dag(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc isAcyclic*(graph:Graph):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_acyclic(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc isSimple*(graph:Graph):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_simple(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc isMultiple*(graph:Graph; es:Edge_selector):NOT__MANAGED =
  var res:Vector_bool

  var ret = igraph_is_multiple(graph.handle.addr, res.addr, es)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc hasLoop*(graph:Graph):NOT__MANAGED =
  var res:bool

  var ret = igraph_has_loop(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc hasMultiple*(graph:Graph):NOT__MANAGED =
  var res:bool

  var ret = igraph_has_multiple(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc countLoops*(graph:Graph):NOT__MANAGED =
  var loop_count:int

  var ret = igraph_count_loops(graph.handle.addr, loop_count.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (loop_count.NOT__MANAGED)

proc countMultiple*(graph:Graph; es:Edge_selector):NOT__MANAGED =
  var res:Vector_int

  var ret = igraph_count_multiple(graph.handle.addr, res.addr, es)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc girth*(graph:Graph):tuple[girth:NOT__MANAGED; circle:NOT__MANAGED] =
  var girth:float
  var circle:Vertex_indices

  var ret = igraph_girth(graph.handle.addr, girth.addr, circle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (girth.NOT__MANAGED, circle.NOT__MANAGED)

proc isPerfect*(graph:Graph):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_perfect(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc addEdge*(from:int; to:int):Graph =
  result = new Graph
  var ret = igraph_add_edge(result.handle.addr, from, to)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc addEdge*(graph:Graph; from:int; to:int) =
  var ret = igraph_add_edge(graph.handle.addr, from, to)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc eigenvectorCentrality*(graph:Graph; directed:bool; scale:bool; weights:Edgeweights):tuple[vector:NOT__MANAGED; value:NOT__MANAGED; options:NOT__MANAGED] =
  var vector:All_vertex_qty
  var value:float
  var options:Arpackopt

  var ret = igraph_eigenvector_centrality(graph.handle.addr, vector.addr, value.addr, directed, scale, weights, options.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED, options.NOT__MANAGED)

proc eigenvectorCentrality*(graph:Graph; directed:bool; scale:bool; weights:Edgeweights; options:Arpackopt):tuple[vector:NOT__MANAGED; value:NOT__MANAGED] =
  var vector:All_vertex_qty
  var value:float

  var ret = igraph_eigenvector_centrality(graph.handle.addr, vector.addr, value.addr, directed, scale, weights, options)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED)

proc hubScore*(graph:Graph; scale:bool; weights:Edgeweights):tuple[vector:NOT__MANAGED; value:NOT__MANAGED; options:NOT__MANAGED] =
  var vector:All_vertex_qty
  var value:float
  var options:Arpackopt

  var ret = igraph_hub_score(graph.handle.addr, vector.addr, value.addr, scale, weights, options.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED, options.NOT__MANAGED)

proc hubScore*(graph:Graph; scale:bool; weights:Edgeweights; options:Arpackopt):tuple[vector:NOT__MANAGED; value:NOT__MANAGED] =
  var vector:All_vertex_qty
  var value:float

  var ret = igraph_hub_score(graph.handle.addr, vector.addr, value.addr, scale, weights, options)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED)

proc authorityScore*(graph:Graph; scale:bool; weights:Edgeweights):tuple[vector:NOT__MANAGED; value:NOT__MANAGED; options:NOT__MANAGED] =
  var vector:All_vertex_qty
  var value:float
  var options:Arpackopt

  var ret = igraph_authority_score(graph.handle.addr, vector.addr, value.addr, scale, weights, options.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED, options.NOT__MANAGED)

proc authorityScore*(graph:Graph; scale:bool; weights:Edgeweights; options:Arpackopt):tuple[vector:NOT__MANAGED; value:NOT__MANAGED] =
  var vector:All_vertex_qty
  var value:float

  var ret = igraph_authority_score(graph.handle.addr, vector.addr, value.addr, scale, weights, options)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED)

proc hubAndAuthorityScores*(graph:Graph; scale:bool; weights:Edgeweights):tuple[hub_vector:NOT__MANAGED; authority_vector:NOT__MANAGED; value:NOT__MANAGED; options:NOT__MANAGED] =
  var hub_vector:All_vertex_qty
  var authority_vector:All_vertex_qty
  var value:float
  var options:Arpackopt

  var ret = igraph_hub_and_authority_scores(graph.handle.addr, hub_vector.addr, authority_vector.addr, value.addr, scale, weights, options.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (hub_vector.NOT__MANAGED, authority_vector.NOT__MANAGED, value.NOT__MANAGED, options.NOT__MANAGED)

proc hubAndAuthorityScores*(graph:Graph; scale:bool; weights:Edgeweights; options:Arpackopt):tuple[hub_vector:NOT__MANAGED; authority_vector:NOT__MANAGED; value:NOT__MANAGED] =
  var hub_vector:All_vertex_qty
  var authority_vector:All_vertex_qty
  var value:float

  var ret = igraph_hub_and_authority_scores(graph.handle.addr, hub_vector.addr, authority_vector.addr, value.addr, scale, weights, options)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (hub_vector.NOT__MANAGED, authority_vector.NOT__MANAGED, value.NOT__MANAGED)

proc unfoldTree*(graph:Graph; mode:Neimode; roots:Vector_int):tuple[tree:Graph; vertex_index:NOT__MANAGED] =
  result = new Graph  var vertex_index:Index_vector

  var ret = igraph_unfold_tree(graph.handle.addrresult.handle.addr, mode, roots, vertex_index.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertex_index.NOT__MANAGED)

proc isMutual*(graph:Graph; es:Edge_selector; loops:bool):NOT__MANAGED =
  var res:Vector_bool

  var ret = igraph_is_mutual(graph.handle.addr, res.addr, es, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc hasMutual*(graph:Graph; loops:bool):NOT__MANAGED =
  var res:bool

  var ret = igraph_has_mutual(graph.handle.addr, res.addr, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc maximumCardinalitySearch*(graph:Graph):tuple[alpha:NOT__MANAGED; alpham1:NOT__MANAGED] =
  var alpha:Index_vector
  var alpham1:Vertex_indices

  var ret = igraph_maximum_cardinality_search(graph.handle.addr, alpha.addr, alpham1.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (alpha.NOT__MANAGED, alpham1.NOT__MANAGED)

proc isChordal*(graph:Graph; alpha:Index_vector; alpham1:Vertex_indices):tuple[chordal:NOT__MANAGED; fillin:NOT__MANAGED; newgraph:Graph] =
  result = new Graph
  var ret = igraph_is_chordal(graph.handle.addr, alpha, alpham1, chordal.addr, fillin.addrresult.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (chordal.NOT__MANAGED, fillin.NOT__MANAGED)

proc avgNearestNeighborDegree*(graph:Graph; vids:Vertex_selector; mode:Neimode; neighbor_degree_mode:Neimode; weights:Edgeweights):tuple[knn:NOT__MANAGED; knnk:NOT__MANAGED] =
  var knn:Vertex_qty
  var knnk:Vector

  var ret = igraph_avg_nearest_neighbor_degree(graph.handle.addr, vids, mode, neighbor_degree_mode, knn.addr, knnk.addr, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (knn.NOT__MANAGED, knnk.NOT__MANAGED)

proc degreeCorrelationVector*(graph:Graph; weights:Edgeweights; from_mode:Neimode; to_mode:Neimode; directed_neighbors:bool):NOT__MANAGED =
  var knnk:Vector

  var ret = igraph_degree_correlation_vector(graph.handle.addr, weights, knnk.addr, from_mode, to_mode, directed_neighbors)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (knnk.NOT__MANAGED)

proc strength*(graph:Graph; vids:Vertex_selector; mode:Neimode; loops:bool; weights:Edgeweights):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_strength(graph.handle.addr, res.addr, vids, mode, loops, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc centralization*(scores:Vector; theoretical_max:float; normalized:bool):float =
  return ( igraph_centralization(scores, theoretical_max, normalized) ).float


proc centralizationDegree*(graph:Graph; mode:Neimode; loops:bool; normalized:bool):tuple[res:NOT__MANAGED; centralization:NOT__MANAGED; theoretical_max:NOT__MANAGED] =
  var res:Vector
  var centralization:float
  var theoretical_max:float

  var ret = igraph_centralization_degree(graph.handle.addr, res.addr, mode, loops, centralization.addr, theoretical_max.addr, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, centralization.NOT__MANAGED, theoretical_max.NOT__MANAGED)

proc centralizationDegreeTmax*(graph:Graph; nodes:int; mode:Neimode; loops:bool):NOT__MANAGED =
  var res:float

  var ret = igraph_centralization_degree_tmax(graph.handle.addr, nodes, mode, loops, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc centralizationBetweenness*(graph:Graph; directed:bool; normalized:bool):tuple[res:NOT__MANAGED; centralization:NOT__MANAGED; theoretical_max:NOT__MANAGED] =
  var res:Vector
  var centralization:float
  var theoretical_max:float

  var ret = igraph_centralization_betweenness(graph.handle.addr, res.addr, directed, centralization.addr, theoretical_max.addr, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, centralization.NOT__MANAGED, theoretical_max.NOT__MANAGED)

proc centralizationBetweennessTmax*(graph:Graph; nodes:int; directed:bool):NOT__MANAGED =
  var res:float

  var ret = igraph_centralization_betweenness_tmax(graph.handle.addr, nodes, directed, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc centralizationCloseness*(graph:Graph; mode:Neimode; normalized:bool):tuple[res:NOT__MANAGED; centralization:NOT__MANAGED; theoretical_max:NOT__MANAGED] =
  var res:Vector
  var centralization:float
  var theoretical_max:float

  var ret = igraph_centralization_closeness(graph.handle.addr, res.addr, mode, centralization.addr, theoretical_max.addr, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, centralization.NOT__MANAGED, theoretical_max.NOT__MANAGED)

proc centralizationClosenessTmax*(graph:Graph; nodes:int; mode:Neimode):NOT__MANAGED =
  var res:float

  var ret = igraph_centralization_closeness_tmax(graph.handle.addr, nodes, mode, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc centralizationEigenvectorCentrality*(graph:Graph; directed:bool; scale:bool; normalized:bool):tuple[vector:NOT__MANAGED; value:NOT__MANAGED; options:NOT__MANAGED; centralization:NOT__MANAGED; theoretical_max:NOT__MANAGED] =
  var vector:Vector
  var value:float
  var options:Arpackopt
  var centralization:float
  var theoretical_max:float

  var ret = igraph_centralization_eigenvector_centrality(graph.handle.addr, vector.addr, value.addr, directed, scale, options.addr, centralization.addr, theoretical_max.addr, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED, options.NOT__MANAGED, centralization.NOT__MANAGED, theoretical_max.NOT__MANAGED)

proc centralizationEigenvectorCentrality*(graph:Graph; directed:bool; scale:bool; options:Arpackopt; normalized:bool):tuple[vector:NOT__MANAGED; value:NOT__MANAGED; centralization:NOT__MANAGED; theoretical_max:NOT__MANAGED] =
  var vector:Vector
  var value:float
  var centralization:float
  var theoretical_max:float

  var ret = igraph_centralization_eigenvector_centrality(graph.handle.addr, vector.addr, value.addr, directed, scale, options, centralization.addr, theoretical_max.addr, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vector.NOT__MANAGED, value.NOT__MANAGED, centralization.NOT__MANAGED, theoretical_max.NOT__MANAGED)

proc centralizationEigenvectorCentralityTmax*(graph:Graph; nodes:int; directed:bool; scale:bool):NOT__MANAGED =
  var res:float

  var ret = igraph_centralization_eigenvector_centrality_tmax(graph.handle.addr, nodes, directed, scale, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc assortativityNominal*(graph:Graph; types:Index_vector; directed:bool; normalized:bool):NOT__MANAGED =
  var res:float

  var ret = igraph_assortativity_nominal(graph.handle.addr, types, res.addr, directed, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc assortativity*(graph:Graph; values:Vector; values_in:Vector; directed:bool; normalized:bool):NOT__MANAGED =
  var res:float

  var ret = igraph_assortativity(graph.handle.addr, values, values_in, res.addr, directed, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc assortativityDegree*(graph:Graph; directed:bool):NOT__MANAGED =
  var res:float

  var ret = igraph_assortativity_degree(graph.handle.addr, res.addr, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc jointDegreeMatrix*(graph:Graph; weights:Edgeweights; max_out_degree:int; max_in_degree:int):NOT__MANAGED =
  var jdm:Matrix

  var ret = igraph_joint_degree_matrix(graph.handle.addr, weights, jdm.addr, max_out_degree, max_in_degree)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (jdm.NOT__MANAGED)

proc jointDegreeDistribution*(graph:Graph; weights:Edgeweights; from_mode:Neimode; to_mode:Neimode; directed_neighbors:bool; normalized:bool; max_from_degree:int; max_to_degree:int):NOT__MANAGED =
  var p:Matrix

  var ret = igraph_joint_degree_distribution(graph.handle.addr, weights, p.addr, from_mode, to_mode, directed_neighbors, normalized, max_from_degree, max_to_degree)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (p.NOT__MANAGED)

proc jointTypeDistribution*(graph:Graph; weights:Edgeweights; from_types:Index_vector; to_types:Index_vector; directed:bool; normalized:bool):NOT__MANAGED =
  var p:Matrix

  var ret = igraph_joint_type_distribution(graph.handle.addr, weights, p.addr, from_types, to_types, directed, normalized)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (p.NOT__MANAGED)

proc contractVertices*(mapping:Index_vector; vertex_attr_comb:Vertex_attribute_combination):Graph =
  result = new Graph
  var ret = igraph_contract_vertices(result.handle.addr, mapping, vertex_attr_comb)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc contractVertices*(graph:Graph; mapping:Index_vector; vertex_attr_comb:Vertex_attribute_combination) =
  var ret = igraph_contract_vertices(graph.handle.addr, mapping, vertex_attr_comb)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc eccentricity*(graph:Graph; vids:Vertex_selector; mode:Neimode):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_eccentricity(graph.handle.addr, res.addr, vids, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc eccentricityDijkstra*(graph:Graph; weights:Edgeweights; vids:Vertex_selector; mode:Neimode):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_eccentricity_dijkstra(graph.handle.addr, weights, res.addr, vids, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc graphCenter*(graph:Graph; mode:Neimode):NOT__MANAGED =
  var res:Vertex_indices

  var ret = igraph_graph_center(graph.handle.addr, res.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc graphCenterDijkstra*(graph:Graph; weights:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Vertex_indices

  var ret = igraph_graph_center_dijkstra(graph.handle.addr, weights, res.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc radius*(graph:Graph; mode:Neimode):NOT__MANAGED =
  var radius:float

  var ret = igraph_radius(graph.handle.addr, radius.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (radius.NOT__MANAGED)

proc radiusDijkstra*(graph:Graph; weights:Edgeweights; mode:Neimode):NOT__MANAGED =
  var radius:float

  var ret = igraph_radius_dijkstra(graph.handle.addr, weights, radius.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (radius.NOT__MANAGED)

proc pseudoDiameter*(graph:Graph; start_vid:Vertex; directed:bool; unconnected:bool):tuple[diameter:NOT__MANAGED; from:NOT__MANAGED; to:NOT__MANAGED] =
  var diameter:float
  var from:int
  var to:int

  var ret = igraph_pseudo_diameter(graph.handle.addr, diameter.addr, start_vid, from.addr, to.addr, directed, unconnected)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (diameter.NOT__MANAGED, from.NOT__MANAGED, to.NOT__MANAGED)

proc pseudoDiameterDijkstra*(graph:Graph; weights:Edgeweights; start_vid:Vertex; directed:bool; unconnected:bool):tuple[diameter:NOT__MANAGED; from:NOT__MANAGED; to:NOT__MANAGED] =
  var diameter:float
  var from:int
  var to:int

  var ret = igraph_pseudo_diameter_dijkstra(graph.handle.addr, weights, diameter.addr, start_vid, from.addr, to.addr, directed, unconnected)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (diameter.NOT__MANAGED, from.NOT__MANAGED, to.NOT__MANAGED)

proc diversity*(graph:Graph; weights:Edgeweights; vids:Vertex_selector):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_diversity(graph.handle.addr, weights, res.addr, vids)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc randomWalk*(graph:Graph; weights:Edgeweights; start:Vertex; mode:Neimode; steps:int; stuck:Rwstuck):tuple[vertices:NOT__MANAGED; edges:NOT__MANAGED] =
  var vertices:Vertex_indices
  var edges:Edge_indices

  var ret = igraph_random_walk(graph.handle.addr, weights, vertices.addr, edges.addr, start, mode, steps, stuck)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertices.NOT__MANAGED, edges.NOT__MANAGED)

proc randomEdgeWalk*(graph:Graph; weights:Edgeweights; start:Vertex; mode:Neimode; steps:int; stuck:Rwstuck):NOT__MANAGED =
  var edgewalk:Edge_indices

  var ret = igraph_random_edge_walk(graph.handle.addr, weights, edgewalk.addr, start, mode, steps, stuck)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edgewalk.NOT__MANAGED)

proc globalEfficiency*(graph:Graph; weights:Edgeweights; directed:bool):NOT__MANAGED =
  var res:float

  var ret = igraph_global_efficiency(graph.handle.addr, res.addr, weights, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc localEfficiency*(graph:Graph; vids:Vertex_selector; weights:Edgeweights; directed:bool; mode:Neimode):NOT__MANAGED =
  var res:Vertex_qty

  var ret = igraph_local_efficiency(graph.handle.addr, res.addr, vids, weights, directed, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc averageLocalEfficiency*(graph:Graph; weights:Edgeweights; directed:bool; mode:Neimode):NOT__MANAGED =
  var res:float

  var ret = igraph_average_local_efficiency(graph.handle.addr, res.addr, weights, directed, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc transitiveClosureDag*(graph:Graph):Graph =
  result = new Graph
  var ret = igraph_transitive_closure_dag(graph.handle.addrresult.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc transitiveClosure*(graph:Graph):Graph =
  result = new Graph
  var ret = igraph_transitive_closure(graph.handle.addrresult.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc trussness*(graph:Graph):NOT__MANAGED =
  var trussness:Vector_int

  var ret = igraph_trussness(graph.handle.addr, trussness.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (trussness.NOT__MANAGED)

proc isBigraphical*(degrees1:Vector_int; degrees2:Vector_int; allowed_edge_types:Edge_type_sw):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_bigraphical(degrees1, degrees2, allowed_edge_types, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc isGraphical*(out_deg:Vector_int; in_deg:Vector_int; allowed_edge_types:Edge_type_sw):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_graphical(out_deg, in_deg, allowed_edge_types, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc bfs*(graph:Graph; root:Vertex; roots:Vertex_indices; mode:Neimode; unreachable:bool; restricted:Vertex_indices; callback:Bfs_func; extra:Extra):tuple[order:NOT__MANAGED; rank:NOT__MANAGED; parents:NOT__MANAGED; pred:NOT__MANAGED; succ:NOT__MANAGED; dist:NOT__MANAGED] =
  var order:Vertex_indices
  var rank:Vector_int
  var parents:Vector_int
  var pred:Vector_int
  var succ:Vector_int
  var dist:Vector_int

  var ret = igraph_bfs(graph.handle.addr, root, roots, mode, unreachable, restricted, order.addr, rank.addr, parents.addr, pred.addr, succ.addr, dist.addr, callback, extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (order.NOT__MANAGED, rank.NOT__MANAGED, parents.NOT__MANAGED, pred.NOT__MANAGED, succ.NOT__MANAGED, dist.NOT__MANAGED)

proc bfsSimple*(graph:Graph; root:Vertex; mode:Neimode):tuple[order:NOT__MANAGED; layers:NOT__MANAGED; parents:NOT__MANAGED] =
  var order:Vertex_indices
  var layers:Vector_int
  var parents:Vector_int

  var ret = igraph_bfs_simple(graph.handle.addr, root, mode, order.addr, layers.addr, parents.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (order.NOT__MANAGED, layers.NOT__MANAGED, parents.NOT__MANAGED)

proc dfs*(graph:Graph; root:Vertex; mode:Neimode; unreachable:bool; in_callback:Dfs_func; out_callback:Dfs_func; extra:Extra):tuple[order:NOT__MANAGED; order_out:NOT__MANAGED; father:NOT__MANAGED; dist:NOT__MANAGED] =
  var order:Vertex_indices
  var order_out:Vertex_indices
  var father:Vector_int
  var dist:Vector_int

  var ret = igraph_dfs(graph.handle.addr, root, mode, unreachable, order.addr, order_out.addr, father.addr, dist.addr, in_callback, out_callback, extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (order.NOT__MANAGED, order_out.NOT__MANAGED, father.NOT__MANAGED, dist.NOT__MANAGED)

proc bipartiteProjectionSize*(graph:Graph; types:Bipartite_types):tuple[vcount1:NOT__MANAGED; ecount1:NOT__MANAGED; vcount2:NOT__MANAGED; ecount2:NOT__MANAGED] =
  var vcount1:int
  var ecount1:int
  var vcount2:int
  var ecount2:int

  var ret = igraph_bipartite_projection_size(graph.handle.addr, types, vcount1.addr, ecount1.addr, vcount2.addr, ecount2.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vcount1.NOT__MANAGED, ecount1.NOT__MANAGED, vcount2.NOT__MANAGED, ecount2.NOT__MANAGED)

proc bipartiteProjection*(graph:Graph; types:Bipartite_types; probe1:int):tuple[proj1:Graph; proj2:Graph; multiplicity1:NOT__MANAGED; multiplicity2:NOT__MANAGED] =
  result = new Graph  var multiplicity1:Vector_int
  var multiplicity2:Vector_int

  var ret = igraph_bipartite_projection(graph.handle.addr, typesresult.handle.addrresult.handle.addr, multiplicity1.addr, multiplicity2.addr, probe1)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (multiplicity1.NOT__MANAGED, multiplicity2.NOT__MANAGED)

proc createBipartite*(types:Bipartite_types; edges:Vector_int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_create_bipartite(result.handle.addr, types, edges, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc biadjacency*(incidence:Matrix; directed:bool; mode:Neimode; multiple:bool):tuple[graph:Graph; types:NOT__MANAGED] =
  result = new Graph  var types:Bipartite_types

  var ret = igraph_biadjacency(result.handle.addr, types.addr, incidence, directed, mode, multiple)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (types.NOT__MANAGED)

proc getBiadjacency*(graph:Graph; types:Bipartite_types):tuple[res:NOT__MANAGED; row_ids:NOT__MANAGED; col_ids:NOT__MANAGED] =
  var res:Matrix
  var row_ids:Index_vector
  var col_ids:Index_vector

  var ret = igraph_get_biadjacency(graph.handle.addr, types, res.addr, row_ids.addr, col_ids.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, row_ids.NOT__MANAGED, col_ids.NOT__MANAGED)

proc isBipartite*(graph:Graph):tuple[res:NOT__MANAGED; type:NOT__MANAGED] =
  var res:bool
  var type:Bipartite_types

  var ret = igraph_is_bipartite(graph.handle.addr, res.addr, type.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, type.NOT__MANAGED)

proc bipartiteGameGnp*(n1:int; n2:int; p:float; directed:bool; mode:Neimode):tuple[graph:Graph; types:NOT__MANAGED] =
  result = new Graph  var types:Bipartite_types

  var ret = igraph_bipartite_game_gnp(result.handle.addr, types.addr, n1, n2, p, directed, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (types.NOT__MANAGED)

proc bipartiteGameGnm*(n1:int; n2:int; m:int; directed:bool; mode:Neimode):tuple[graph:Graph; types:NOT__MANAGED] =
  result = new Graph  var types:Bipartite_types

  var ret = igraph_bipartite_game_gnm(result.handle.addr, types.addr, n1, n2, m, directed, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (types.NOT__MANAGED)

proc bipartiteGame*(type:Erdos_renyi_type; n1:int; n2:int; p:float; m:int; directed:bool; mode:Neimode):tuple[graph:Graph; types:NOT__MANAGED] =
  result = new Graph  var types:Bipartite_types

  var ret = igraph_bipartite_game(result.handle.addr, types.addr, type, n1, n2, p, m, directed, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (types.NOT__MANAGED)

proc getLaplacian*(graph:Graph; mode:Neimode; normalization:Laplacian_normalization; weights:Edgeweights):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_get_laplacian(graph.handle.addr, res.addr, mode, normalization, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc getLaplacianSparse*(graph:Graph; mode:Neimode; normalization:Laplacian_normalization; weights:Edgeweights):NOT__MANAGED =
  var sparseres:Sparsemat

  var ret = igraph_get_laplacian_sparse(graph.handle.addr, sparseres.addr, mode, normalization, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (sparseres.NOT__MANAGED)

proc connectedComponents*(graph:Graph; mode:Connectedness):tuple[membership:NOT__MANAGED; csize:NOT__MANAGED; no:NOT__MANAGED] =
  var membership:Vector_int
  var csize:Vector_int
  var no:int

  var ret = igraph_connected_components(graph.handle.addr, membership.addr, csize.addr, no.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED, csize.NOT__MANAGED, no.NOT__MANAGED)

proc isConnected*(graph:Graph; mode:Connectedness):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_connected(graph.handle.addr, res.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc decompose*(graph:Graph; mode:Connectedness; maxcompno:int; minelements:int):NOT__MANAGED =
  var components:Graph_list

  var ret = igraph_decompose(graph.handle.addr, components.addr, mode, maxcompno, minelements)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (components.NOT__MANAGED)

proc articulationPoints*(graph:Graph):NOT__MANAGED =
  var res:Vertex_indices

  var ret = igraph_articulation_points(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc biconnectedComponents*(graph:Graph):tuple[no:NOT__MANAGED; tree_edges:NOT__MANAGED; component_edges:NOT__MANAGED; components:NOT__MANAGED; articulation_points:NOT__MANAGED] =
  var no:int
  var tree_edges:Edgeset_list
  var component_edges:Edgeset_list
  var components:Vertexset_list
  var articulation_points:Vertex_indices

  var ret = igraph_biconnected_components(graph.handle.addr, no.addr, tree_edges.addr, component_edges.addr, components.addr, articulation_points.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (no.NOT__MANAGED, tree_edges.NOT__MANAGED, component_edges.NOT__MANAGED, components.NOT__MANAGED, articulation_points.NOT__MANAGED)

proc bridges*(graph:Graph):NOT__MANAGED =
  var res:Edge_indices

  var ret = igraph_bridges(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc isBiconnected*(graph:Graph):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_biconnected(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc countReachable*(graph:Graph; mode:Neimode):NOT__MANAGED =
  var counts:Vector_int

  var ret = igraph_count_reachable(graph.handle.addr, counts.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (counts.NOT__MANAGED)

proc isClique*(graph:Graph; candidate:Vertex_selector; directed:bool):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_clique(graph.handle.addr, candidate, directed, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc cliques*(graph:Graph; min_size:int; max_size:int):NOT__MANAGED =
  var res:Vertexset_list

  var ret = igraph_cliques(graph.handle.addr, res.addr, min_size, max_size)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc cliquesCallback*(graph:Graph; min_size:int; max_size:int; cliquehandler_fn:Clique_func; arg:Extra) =
  var ret = igraph_cliques_callback(graph.handle.addr, min_size, max_size, cliquehandler_fn, arg)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc cliqueSizeHist*(graph:Graph; min_size:int; max_size:int):NOT__MANAGED =
  var hist:Vector

  var ret = igraph_clique_size_hist(graph.handle.addr, hist.addr, min_size, max_size)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (hist.NOT__MANAGED)

proc largestCliques*(graph:Graph):NOT__MANAGED =
  var res:Vertexset_list

  var ret = igraph_largest_cliques(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc maximalCliques*(graph:Graph; min_size:int; max_size:int):NOT__MANAGED =
  var res:Vertexset_list

  var ret = igraph_maximal_cliques(graph.handle.addr, res.addr, min_size, max_size)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc maximalCliquesSubset*(graph:Graph; subset:Vertex_indices; outfile:Outfile; min_size:int; max_size:int):tuple[res:NOT__MANAGED; no:NOT__MANAGED] =
  var res:Vertexset_list
  var no:int

  var ret = igraph_maximal_cliques_subset(graph.handle.addr, subset, res.addr, no.addr, outfile, min_size, max_size)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, no.NOT__MANAGED)

proc maximalCliquesCallback*(graph:Graph; cliquehandler_fn:Clique_func; arg:Extra; min_size:int; max_size:int) =
  var ret = igraph_maximal_cliques_callback(graph.handle.addr, cliquehandler_fn, arg, min_size, max_size)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc maximalCliquesCount*(graph:Graph; min_size:int; max_size:int):NOT__MANAGED =
  var no:int

  var ret = igraph_maximal_cliques_count(graph.handle.addr, no.addr, min_size, max_size)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (no.NOT__MANAGED)

proc maximalCliquesFile*(graph:Graph; res:Outfile; min_size:int; max_size:int) =
  var ret = igraph_maximal_cliques_file(graph.handle.addr, res, min_size, max_size)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc maximalCliquesHist*(graph:Graph; min_size:int; max_size:int):NOT__MANAGED =
  var hist:Vector

  var ret = igraph_maximal_cliques_hist(graph.handle.addr, hist.addr, min_size, max_size)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (hist.NOT__MANAGED)

proc cliqueNumber*(graph:Graph):NOT__MANAGED =
  var no:int

  var ret = igraph_clique_number(graph.handle.addr, no.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (no.NOT__MANAGED)

proc weightedCliques*(graph:Graph; vertex_weights:Vertexweights; min_weight:float; max_weight:float; maximal:bool):NOT__MANAGED =
  var res:Vertexset_list

  var ret = igraph_weighted_cliques(graph.handle.addr, vertex_weights, res.addr, min_weight, max_weight, maximal)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc largestWeightedCliques*(graph:Graph; vertex_weights:Vertexweights):NOT__MANAGED =
  var res:Vertexset_list

  var ret = igraph_largest_weighted_cliques(graph.handle.addr, vertex_weights, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc weightedCliqueNumber*(graph:Graph; vertex_weights:Vertexweights):NOT__MANAGED =
  var res:float

  var ret = igraph_weighted_clique_number(graph.handle.addr, vertex_weights, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc isIndependentVertexSet*(graph:Graph; candidate:Vertex_selector):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_independent_vertex_set(graph.handle.addr, candidate, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc independentVertexSets*(graph:Graph; min_size:int; max_size:int):NOT__MANAGED =
  var res:Vertexset_list

  var ret = igraph_independent_vertex_sets(graph.handle.addr, res.addr, min_size, max_size)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc largestIndependentVertexSets*(graph:Graph):NOT__MANAGED =
  var res:Vertexset_list

  var ret = igraph_largest_independent_vertex_sets(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc maximalIndependentVertexSets*(graph:Graph):NOT__MANAGED =
  var res:Vertexset_list

  var ret = igraph_maximal_independent_vertex_sets(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc independenceNumber*(graph:Graph):NOT__MANAGED =
  var no:int

  var ret = igraph_independence_number(graph.handle.addr, no.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (no.NOT__MANAGED)

proc layoutRandom*(graph:Graph):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_random(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutCircle*(graph:Graph; order:Vertex_selector):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_circle(graph.handle.addr, res.addr, order)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutStar*(graph:Graph; center:Vertex; order:Index_vector):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_star(graph.handle.addr, res.addr, center, order)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutGrid*(graph:Graph; width:int):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_grid(graph.handle.addr, res.addr, width)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutGrid3d*(graph:Graph; width:int; height:int):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_grid_3d(graph.handle.addr, res.addr, width, height)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutFruchtermanReingold*(graph:Graph; use_seed:bool; niter:int; start_temp:float; grid:Layout_grid; weights:Edgeweights; minx:Vector; maxx:Vector; miny:Vector; maxy:Vector; coolexp:Deprecated; maxdelta:Deprecated; area:Deprecated; repulserad:Deprecated):NOT__MANAGED =
  var coords:Matrix

  var ret = igraph_layout_fruchterman_reingold(graph.handle.addr, coords.addr, use_seed, niter, start_temp, grid, weights, minx, maxx, miny, maxy, coolexp, maxdelta, area, repulserad)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (coords.NOT__MANAGED)

proc layoutFruchtermanReingold*(graph:Graph; coords:Matrix; use_seed:bool; niter:int; start_temp:float; grid:Layout_grid; weights:Edgeweights; minx:Vector; maxx:Vector; miny:Vector; maxy:Vector; coolexp:Deprecated; maxdelta:Deprecated; area:Deprecated; repulserad:Deprecated) =
  var ret = igraph_layout_fruchterman_reingold(graph.handle.addr, coords, use_seed, niter, start_temp, grid, weights, minx, maxx, miny, maxy, coolexp, maxdelta, area, repulserad)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutKamadaKawai*(graph:Graph; use_seed:bool; maxiter:int; epsilon:float; kkconst:float; weights:Edgeweights; minx:Vector; maxx:Vector; miny:Vector; maxy:Vector):NOT__MANAGED =
  var coords:Matrix

  var ret = igraph_layout_kamada_kawai(graph.handle.addr, coords.addr, use_seed, maxiter, epsilon, kkconst, weights, minx, maxx, miny, maxy)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (coords.NOT__MANAGED)

proc layoutKamadaKawai*(graph:Graph; coords:Matrix; use_seed:bool; maxiter:int; epsilon:float; kkconst:float; weights:Edgeweights; minx:Vector; maxx:Vector; miny:Vector; maxy:Vector) =
  var ret = igraph_layout_kamada_kawai(graph.handle.addr, coords, use_seed, maxiter, epsilon, kkconst, weights, minx, maxx, miny, maxy)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutLgl*(graph:Graph; maxiter:int; maxdelta:float; area:float; coolexp:float; repulserad:float; cellsize:float; root:int):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_lgl(graph.handle.addr, res.addr, maxiter, maxdelta, area, coolexp, repulserad, cellsize, root)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutReingoldTilford*(graph:Graph; mode:Neimode; roots:Vertex_indices; rootlevel:Vector_int):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_reingold_tilford(graph.handle.addr, res.addr, mode, roots, rootlevel)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutReingoldTilfordCircular*(graph:Graph; mode:Neimode; roots:Vertex_indices; rootlevel:Vector_int):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_reingold_tilford_circular(graph.handle.addr, res.addr, mode, roots, rootlevel)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc rootsForTreeLayout*(graph:Graph; mode:Neimode; heuristic:Rootchoice):NOT__MANAGED =
  var roots:Vertex_indices

  var ret = igraph_roots_for_tree_layout(graph.handle.addr, mode, roots.addr, heuristic)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (roots.NOT__MANAGED)

proc layoutRandom3d*(graph:Graph):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_random_3d(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutSphere*(graph:Graph):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_sphere(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutFruchtermanReingold3d*(graph:Graph; use_seed:bool; niter:int; start_temp:float; weights:Edgeweights; minx:Vector; maxx:Vector; miny:Vector; maxy:Vector; minz:Vector; maxz:Vector; coolexp:Deprecated; maxdelta:Deprecated; area:Deprecated; repulserad:Deprecated):NOT__MANAGED =
  var coords:Matrix

  var ret = igraph_layout_fruchterman_reingold_3d(graph.handle.addr, coords.addr, use_seed, niter, start_temp, weights, minx, maxx, miny, maxy, minz, maxz, coolexp, maxdelta, area, repulserad)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (coords.NOT__MANAGED)

proc layoutFruchtermanReingold3d*(graph:Graph; coords:Matrix; use_seed:bool; niter:int; start_temp:float; weights:Edgeweights; minx:Vector; maxx:Vector; miny:Vector; maxy:Vector; minz:Vector; maxz:Vector; coolexp:Deprecated; maxdelta:Deprecated; area:Deprecated; repulserad:Deprecated) =
  var ret = igraph_layout_fruchterman_reingold_3d(graph.handle.addr, coords, use_seed, niter, start_temp, weights, minx, maxx, miny, maxy, minz, maxz, coolexp, maxdelta, area, repulserad)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutKamadaKawai3d*(graph:Graph; use_seed:bool; maxiter:int; epsilon:float; kkconst:float; weights:Edgeweights; minx:Vector; maxx:Vector; miny:Vector; maxy:Vector; minz:Vector; maxz:Vector):NOT__MANAGED =
  var coords:Matrix

  var ret = igraph_layout_kamada_kawai_3d(graph.handle.addr, coords.addr, use_seed, maxiter, epsilon, kkconst, weights, minx, maxx, miny, maxy, minz, maxz)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (coords.NOT__MANAGED)

proc layoutKamadaKawai3d*(graph:Graph; coords:Matrix; use_seed:bool; maxiter:int; epsilon:float; kkconst:float; weights:Edgeweights; minx:Vector; maxx:Vector; miny:Vector; maxy:Vector; minz:Vector; maxz:Vector) =
  var ret = igraph_layout_kamada_kawai_3d(graph.handle.addr, coords, use_seed, maxiter, epsilon, kkconst, weights, minx, maxx, miny, maxy, minz, maxz)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutGraphopt*(graph:Graph; niter:int; node_charge:float; node_mass:float; spring_length:float; spring_constant:float; max_sa_movement:float; use_seed:bool):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_graphopt(graph.handle.addr, res.addr, niter, node_charge, node_mass, spring_length, spring_constant, max_sa_movement, use_seed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutGraphopt*(graph:Graph; res:Matrix; niter:int; node_charge:float; node_mass:float; spring_length:float; spring_constant:float; max_sa_movement:float; use_seed:bool) =
  var ret = igraph_layout_graphopt(graph.handle.addr, res, niter, node_charge, node_mass, spring_length, spring_constant, max_sa_movement, use_seed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutDrl*(graph:Graph; use_seed:bool; options:Drl_options; weights:Edgeweights):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_drl(graph.handle.addr, res.addr, use_seed, options, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutDrl*(graph:Graph; res:Matrix; use_seed:bool; options:Drl_options; weights:Edgeweights) =
  var ret = igraph_layout_drl(graph.handle.addr, res, use_seed, options, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutDrl3d*(graph:Graph; use_seed:bool; options:Drl_options; weights:Edgeweights):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_drl_3d(graph.handle.addr, res.addr, use_seed, options, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutDrl3d*(graph:Graph; res:Matrix; use_seed:bool; options:Drl_options; weights:Edgeweights) =
  var ret = igraph_layout_drl_3d(graph.handle.addr, res, use_seed, options, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutMergeDla*(graphs:Graph_ptr_list; coords:Matrix_list):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_merge_dla(graphs, coords, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutSugiyama*(graph:Graph; layers:Index_vector; hgap:float; vgap:float; maxiter:int; weights:Edgeweights):tuple[res:NOT__MANAGED; extd_graph:Graph; extd_to_orig_eids:NOT__MANAGED] =
  result = new Graph  var extd_to_orig_eids:Index_vector

  var ret = igraph_layout_sugiyama(graph.handle.addr, res.addrresult.handle.addr, extd_to_orig_eids.addr, layers, hgap, vgap, maxiter, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, extd_to_orig_eids.NOT__MANAGED)

proc layoutMds*(graph:Graph; dist:Matrix; dim:int):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_mds(graph.handle.addr, res.addr, dist, dim)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutBipartite*(graph:Graph; types:Bipartite_types; hgap:float; vgap:float; maxiter:int):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_bipartite(graph.handle.addr, types, res.addr, hgap, vgap, maxiter)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutGem*(graph:Graph; use_seed:bool; maxiter:int; temp_max:float; temp_min:float; temp_init:float):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_gem(graph.handle.addr, res.addr, use_seed, maxiter, temp_max, temp_min, temp_init)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutGem*(graph:Graph; res:Matrix; use_seed:bool; maxiter:int; temp_max:float; temp_min:float; temp_init:float) =
  var ret = igraph_layout_gem(graph.handle.addr, res, use_seed, maxiter, temp_max, temp_min, temp_init)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutDavidsonHarel*(graph:Graph; use_seed:bool; maxiter:int; fineiter:int; cool_fact:float; weight_node_dist:float; weight_border:float; weight_edge_lengths:float; weight_edge_crossings:float; weight_node_edge_dist:float):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_davidson_harel(graph.handle.addr, res.addr, use_seed, maxiter, fineiter, cool_fact, weight_node_dist, weight_border, weight_edge_lengths, weight_edge_crossings, weight_node_edge_dist)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutDavidsonHarel*(graph:Graph; res:Matrix; use_seed:bool; maxiter:int; fineiter:int; cool_fact:float; weight_node_dist:float; weight_border:float; weight_edge_lengths:float; weight_edge_crossings:float; weight_node_edge_dist:float) =
  var ret = igraph_layout_davidson_harel(graph.handle.addr, res, use_seed, maxiter, fineiter, cool_fact, weight_node_dist, weight_border, weight_edge_lengths, weight_edge_crossings, weight_node_edge_dist)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutUmap*(graph:Graph; use_seed:bool; distances:Vector; min_dist:float; epochs:int; distances_are_weights:bool):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_umap(graph.handle.addr, res.addr, use_seed, distances, min_dist, epochs, distances_are_weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutUmap*(graph:Graph; res:Matrix; use_seed:bool; distances:Vector; min_dist:float; epochs:int; distances_are_weights:bool) =
  var ret = igraph_layout_umap(graph.handle.addr, res, use_seed, distances, min_dist, epochs, distances_are_weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutUmap3d*(graph:Graph; use_seed:bool; distances:Vector; min_dist:float; epochs:int; distances_are_weights:bool):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_layout_umap_3d(graph.handle.addr, res.addr, use_seed, distances, min_dist, epochs, distances_are_weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc layoutUmap3d*(graph:Graph; res:Matrix; use_seed:bool; distances:Vector; min_dist:float; epochs:int; distances_are_weights:bool) =
  var ret = igraph_layout_umap_3d(graph.handle.addr, res, use_seed, distances, min_dist, epochs, distances_are_weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc layoutUmapComputeWeights*(graph:Graph; distances:Vector):NOT__MANAGED =
  var weights:Vector

  var ret = igraph_layout_umap_compute_weights(graph.handle.addr, distances, weights.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (weights.NOT__MANAGED)

proc layoutUmapComputeWeights*(graph:Graph; distances:Vector; weights:Vector) =
  var ret = igraph_layout_umap_compute_weights(graph.handle.addr, distances, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc cocitation*(graph:Graph; vids:Vertex_selector):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_cocitation(graph.handle.addr, res.addr, vids)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc bibcoupling*(graph:Graph; vids:Vertex_selector):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_bibcoupling(graph.handle.addr, res.addr, vids)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc similarityDice*(graph:Graph; vids:Vertex_selector; mode:Neimode; loops:bool):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_similarity_dice(graph.handle.addr, res.addr, vids, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc similarityDiceEs*(graph:Graph; es:Edge_selector; mode:Neimode; loops:bool):NOT__MANAGED =
  var res:Vector

  var ret = igraph_similarity_dice_es(graph.handle.addr, res.addr, es, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc similarityDicePairs*(graph:Graph; pairs:Vertex_index_pairs; mode:Neimode; loops:bool):NOT__MANAGED =
  var res:Vector

  var ret = igraph_similarity_dice_pairs(graph.handle.addr, res.addr, pairs, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc similarityInverseLogWeighted*(graph:Graph; vids:Vertex_selector; mode:Neimode):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_similarity_inverse_log_weighted(graph.handle.addr, res.addr, vids, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc similarityJaccard*(graph:Graph; vids:Vertex_selector; mode:Neimode; loops:bool):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_similarity_jaccard(graph.handle.addr, res.addr, vids, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc similarityJaccardEs*(graph:Graph; es:Edge_selector; mode:Neimode; loops:bool):NOT__MANAGED =
  var res:Vector

  var ret = igraph_similarity_jaccard_es(graph.handle.addr, res.addr, es, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc similarityJaccardPairs*(graph:Graph; pairs:Vertex_index_pairs; mode:Neimode; loops:bool):NOT__MANAGED =
  var res:Vector

  var ret = igraph_similarity_jaccard_pairs(graph.handle.addr, res.addr, pairs, mode, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc compareCommunities*(comm1:Vector_int; comm2:Vector_int; method:Commcmp):NOT__MANAGED =
  var res:float

  var ret = igraph_compare_communities(comm1, comm2, res.addr, method)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc communitySpinglass*(graph:Graph; weights:Edgeweights; spins:int; parupdate:bool; starttemp:float; stoptemp:float; coolfact:float; update_rule:Spincommupdate; gamma:float; implementation:Spinglass_implementation; lambda:float):tuple[modularity:NOT__MANAGED; temperature:NOT__MANAGED; membership:NOT__MANAGED; csize:NOT__MANAGED] =
  var modularity:float
  var temperature:float
  var membership:Vector_int
  var csize:Vector_int

  var ret = igraph_community_spinglass(graph.handle.addr, weights, modularity.addr, temperature.addr, membership.addr, csize.addr, spins, parupdate, starttemp, stoptemp, coolfact, update_rule, gamma, implementation, lambda)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (modularity.NOT__MANAGED, temperature.NOT__MANAGED, membership.NOT__MANAGED, csize.NOT__MANAGED)

proc communitySpinglassSingle*(graph:Graph; weights:Edgeweights; vertex:int; spins:int; update_rule:Spincommupdate; gamma:float):tuple[community:NOT__MANAGED; cohesion:NOT__MANAGED; adhesion:NOT__MANAGED; inner_links:NOT__MANAGED; outer_links:NOT__MANAGED] =
  var community:Vector_int
  var cohesion:float
  var adhesion:float
  var inner_links:int
  var outer_links:int

  var ret = igraph_community_spinglass_single(graph.handle.addr, weights, vertex, community.addr, cohesion.addr, adhesion.addr, inner_links.addr, outer_links.addr, spins, update_rule, gamma)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (community.NOT__MANAGED, cohesion.NOT__MANAGED, adhesion.NOT__MANAGED, inner_links.NOT__MANAGED, outer_links.NOT__MANAGED)

proc communityWalktrap*(graph:Graph; weights:Edgeweights; steps:int):tuple[merges:NOT__MANAGED; modularity:NOT__MANAGED; membership:NOT__MANAGED] =
  var merges:Matrix_int
  var modularity:Vector
  var membership:Vector_int

  var ret = igraph_community_walktrap(graph.handle.addr, weights, steps, merges.addr, modularity.addr, membership.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (merges.NOT__MANAGED, modularity.NOT__MANAGED, membership.NOT__MANAGED)

proc communityEdgeBetweenness*(graph:Graph; directed:bool; weights:Edgeweights):tuple[removed_edges:NOT__MANAGED; edge_betweenness:NOT__MANAGED; merges:NOT__MANAGED; bridges:NOT__MANAGED; modularity:NOT__MANAGED; membership:NOT__MANAGED] =
  var removed_edges:Vector_int
  var edge_betweenness:Vector
  var merges:Matrix_int
  var bridges:Index_vector
  var modularity:Vector
  var membership:Vector_int

  var ret = igraph_community_edge_betweenness(graph.handle.addr, removed_edges.addr, edge_betweenness.addr, merges.addr, bridges.addr, modularity.addr, membership.addr, directed, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (removed_edges.NOT__MANAGED, edge_betweenness.NOT__MANAGED, merges.NOT__MANAGED, bridges.NOT__MANAGED, modularity.NOT__MANAGED, membership.NOT__MANAGED)

proc communityEbGetMerges*(graph:Graph; directed:bool; edges:Edge_indices; weights:Edgeweights):tuple[merges:NOT__MANAGED; bridges:NOT__MANAGED; modularity:NOT__MANAGED; membership:NOT__MANAGED] =
  var merges:Matrix_int
  var bridges:Index_vector
  var modularity:Vector
  var membership:Vector_int

  var ret = igraph_community_eb_get_merges(graph.handle.addr, directed, edges, weights, merges.addr, bridges.addr, modularity.addr, membership.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (merges.NOT__MANAGED, bridges.NOT__MANAGED, modularity.NOT__MANAGED, membership.NOT__MANAGED)

proc communityFastgreedy*(graph:Graph; weights:Edgeweights):tuple[merges:NOT__MANAGED; modularity:NOT__MANAGED; membership:NOT__MANAGED] =
  var merges:Matrix_int
  var modularity:Vector
  var membership:Vector_int

  var ret = igraph_community_fastgreedy(graph.handle.addr, weights, merges.addr, modularity.addr, membership.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (merges.NOT__MANAGED, modularity.NOT__MANAGED, membership.NOT__MANAGED)

proc communityToMembership*(merges:Matrix_int; nodes:int; steps:int):tuple[membership:NOT__MANAGED; csize:NOT__MANAGED] =
  var membership:Vector_int
  var csize:Vector_int

  var ret = igraph_community_to_membership(merges, nodes, steps, membership.addr, csize.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED, csize.NOT__MANAGED)

proc leCommunityToMembership*(merges:Matrix_int; steps:int):tuple[membership:NOT__MANAGED; csize:NOT__MANAGED] =
  var membership:Vector_int
  var csize:Vector_int

  var ret = igraph_le_community_to_membership(merges, steps, membership.addr, csize.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED, csize.NOT__MANAGED)

proc leCommunityToMembership*(merges:Matrix_int; steps:int; membership:Vector_int):NOT__MANAGED =
  var csize:Vector_int

  var ret = igraph_le_community_to_membership(merges, steps, membership, csize.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (csize.NOT__MANAGED)

proc modularity*(graph:Graph; membership:Vector_int; weights:Edgeweights; resolution:float; directed:bool):NOT__MANAGED =
  var modularity:float

  var ret = igraph_modularity(graph.handle.addr, membership, weights, resolution, directed, modularity.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (modularity.NOT__MANAGED)

proc modularityMatrix*(graph:Graph; weights:Edgeweights; resolution:float; directed:bool):NOT__MANAGED =
  var modmat:Matrix

  var ret = igraph_modularity_matrix(graph.handle.addr, weights, resolution, modmat.addr, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (modmat.NOT__MANAGED)

proc reindexMembership*():tuple[membership:NOT__MANAGED; new_to_old:NOT__MANAGED; nb_clusters:NOT__MANAGED] =
  var membership:Vector_int
  var new_to_old:Index_vector
  var nb_clusters:int

  var ret = igraph_reindex_membership(membership.addr, new_to_old.addr, nb_clusters.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED, new_to_old.NOT__MANAGED, nb_clusters.NOT__MANAGED)

proc reindexMembership*(membership:Vector_int):tuple[new_to_old:NOT__MANAGED; nb_clusters:NOT__MANAGED] =
  var new_to_old:Index_vector
  var nb_clusters:int

  var ret = igraph_reindex_membership(membership, new_to_old.addr, nb_clusters.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (new_to_old.NOT__MANAGED, nb_clusters.NOT__MANAGED)

proc communityLeadingEigenvector*(graph:Graph; weights:Edgeweights; steps:int; start:bool; callback:Levcfunc; callback_extra:Extra):tuple[merges:NOT__MANAGED; membership:NOT__MANAGED; options:NOT__MANAGED; modularity:NOT__MANAGED; eigenvalues:NOT__MANAGED; eigenvectors:NOT__MANAGED; history:NOT__MANAGED] =
  var merges:Matrix_int
  var membership:Vector_int
  var options:Arpackopt
  var modularity:float
  var eigenvalues:Vector
  var eigenvectors:Vector_list
  var history:Vector

  var ret = igraph_community_leading_eigenvector(graph.handle.addr, weights, merges.addr, membership.addr, steps, options.addr, modularity.addr, start, eigenvalues.addr, eigenvectors.addr, history.addr, callback, callback_extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (merges.NOT__MANAGED, membership.NOT__MANAGED, options.NOT__MANAGED, modularity.NOT__MANAGED, eigenvalues.NOT__MANAGED, eigenvectors.NOT__MANAGED, history.NOT__MANAGED)

proc communityLeadingEigenvector*(graph:Graph; weights:Edgeweights; steps:int; options:Arpackopt; start:bool; callback:Levcfunc; callback_extra:Extra):tuple[merges:NOT__MANAGED; membership:NOT__MANAGED; modularity:NOT__MANAGED; eigenvalues:NOT__MANAGED; eigenvectors:NOT__MANAGED; history:NOT__MANAGED] =
  var merges:Matrix_int
  var membership:Vector_int
  var modularity:float
  var eigenvalues:Vector
  var eigenvectors:Vector_list
  var history:Vector

  var ret = igraph_community_leading_eigenvector(graph.handle.addr, weights, merges.addr, membership.addr, steps, options, modularity.addr, start, eigenvalues.addr, eigenvectors.addr, history.addr, callback, callback_extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (merges.NOT__MANAGED, membership.NOT__MANAGED, modularity.NOT__MANAGED, eigenvalues.NOT__MANAGED, eigenvectors.NOT__MANAGED, history.NOT__MANAGED)

proc communityFluidCommunities*(graph:Graph; no_of_communities:int):NOT__MANAGED =
  var membership:Vector_int

  var ret = igraph_community_fluid_communities(graph.handle.addr, no_of_communities, membership.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED)

proc communityLabelPropagation*(graph:Graph; mode:Neimode; weights:Edgeweights; initial:Index_vector; fixed:Vector_bool):NOT__MANAGED =
  var membership:Vector_int

  var ret = igraph_community_label_propagation(graph.handle.addr, membership.addr, mode, weights, initial, fixed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED)

proc communityMultilevel*(graph:Graph; weights:Edgeweights; resolution:float):tuple[membership:NOT__MANAGED; memberships:NOT__MANAGED; modularity:NOT__MANAGED] =
  var membership:Vector_int
  var memberships:Matrix_int
  var modularity:Vector

  var ret = igraph_community_multilevel(graph.handle.addr, weights, resolution, membership.addr, memberships.addr, modularity.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED, memberships.NOT__MANAGED, modularity.NOT__MANAGED)

proc communityOptimalModularity*(graph:Graph; weights:Edgeweights):tuple[modularity:NOT__MANAGED; membership:NOT__MANAGED] =
  var modularity:float
  var membership:Vector_int

  var ret = igraph_community_optimal_modularity(graph.handle.addr, modularity.addr, membership.addr, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (modularity.NOT__MANAGED, membership.NOT__MANAGED)

proc communityLeiden*(graph:Graph; weights:Edgeweights; vertex_weights:Vertexweights; resolution:float; beta:float; start:bool; n_iterations:int):tuple[membership:NOT__MANAGED; nb_clusters:NOT__MANAGED; quality:NOT__MANAGED] =
  var membership:Vector_int
  var nb_clusters:int
  var quality:float

  var ret = igraph_community_leiden(graph.handle.addr, weights, vertex_weights, resolution, beta, start, n_iterations, membership.addr, nb_clusters.addr, quality.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED, nb_clusters.NOT__MANAGED, quality.NOT__MANAGED)

proc communityLeiden*(graph:Graph; weights:Edgeweights; vertex_weights:Vertexweights; resolution:float; beta:float; start:bool; n_iterations:int; membership:Vector_int):tuple[nb_clusters:NOT__MANAGED; quality:NOT__MANAGED] =
  var nb_clusters:int
  var quality:float

  var ret = igraph_community_leiden(graph.handle.addr, weights, vertex_weights, resolution, beta, start, n_iterations, membership, nb_clusters.addr, quality.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (nb_clusters.NOT__MANAGED, quality.NOT__MANAGED)

proc splitJoinDistance*(comm1:Vector_int; comm2:Vector_int):tuple[distance12:NOT__MANAGED; distance21:NOT__MANAGED] =
  var distance12:int
  var distance21:int

  var ret = igraph_split_join_distance(comm1, comm2, distance12.addr, distance21.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (distance12.NOT__MANAGED, distance21.NOT__MANAGED)

proc communityInfomap*(graph:Graph; e_weights:Edgeweights; v_weights:Vertexweights; nb_trials:int):tuple[membership:NOT__MANAGED; codelength:NOT__MANAGED] =
  var membership:Vector_int
  var codelength:float

  var ret = igraph_community_infomap(graph.handle.addr, e_weights, v_weights, nb_trials, membership.addr, codelength.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED, codelength.NOT__MANAGED)

proc communityVoronoi*(graph:Graph; lengths:Edge_lengths; weights:Edgeweights; mode:Neimode; radius:float):tuple[membership:NOT__MANAGED; generators:NOT__MANAGED; modularity:NOT__MANAGED] =
  var membership:Vector_int
  var generators:Vertex_indices
  var modularity:float

  var ret = igraph_community_voronoi(graph.handle.addr, membership.addr, generators.addr, modularity.addr, lengths, weights, mode, radius)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (membership.NOT__MANAGED, generators.NOT__MANAGED, modularity.NOT__MANAGED)

proc graphlets*(graph:Graph; weights:Edgeweights; niter:int):tuple[cliques:NOT__MANAGED; Mu:NOT__MANAGED] =
  var cliques:Vertexset_list
  var Mu:Vector

  var ret = igraph_graphlets(graph.handle.addr, weights, cliques.addr, Mu.addr, niter)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (cliques.NOT__MANAGED, Mu.NOT__MANAGED)

proc graphletsCandidateBasis*(graph:Graph; weights:Edgeweights):tuple[cliques:NOT__MANAGED; thresholds:NOT__MANAGED] =
  var cliques:Vertexset_list
  var thresholds:Vector

  var ret = igraph_graphlets_candidate_basis(graph.handle.addr, weights, cliques.addr, thresholds.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (cliques.NOT__MANAGED, thresholds.NOT__MANAGED)

proc graphletsProject*(graph:Graph; weights:Edgeweights; cliques:Vertexset_list; startMu:bool; niter:int):NOT__MANAGED =
  var Muc:Vector

  var ret = igraph_graphlets_project(graph.handle.addr, weights, cliques, Muc.addr, startMu, niter)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (Muc.NOT__MANAGED)

proc graphletsProject*(graph:Graph; weights:Edgeweights; cliques:Vertexset_list; Muc:Vector; startMu:bool; niter:int) =
  var ret = igraph_graphlets_project(graph.handle.addr, weights, cliques, Muc, startMu, niter)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc hrgFit*(graph:Graph; start:bool; steps:int):NOT__MANAGED =
  var hrg:Hrg

  var ret = igraph_hrg_fit(graph.handle.addr, hrg.addr, start, steps)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (hrg.NOT__MANAGED)

proc hrgFit*(graph:Graph; hrg:Hrg; start:bool; steps:int) =
  var ret = igraph_hrg_fit(graph.handle.addr, hrg, start, steps)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc hrgSample*(hrg:Hrg):Graph =
  result = new Graph
  var ret = igraph_hrg_sample(hrgresult.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc hrgSampleMany*(hrg:Hrg; num_samples:int):NOT__MANAGED =
  var samples:Graph_list

  var ret = igraph_hrg_sample_many(hrg, samples.addr, num_samples)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (samples.NOT__MANAGED)

proc hrgGame*(hrg:Hrg):Graph =
  result = new Graph
  var ret = igraph_hrg_game(result.handle.addr, hrg)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc hrgConsensus*(graph:Graph; start:bool; num_samples:int):tuple[parents:NOT__MANAGED; weights:NOT__MANAGED; hrg:NOT__MANAGED] =
  var parents:Vector_int
  var weights:Vector
  var hrg:Hrg

  var ret = igraph_hrg_consensus(graph.handle.addr, parents.addr, weights.addr, hrg.addr, start, num_samples)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (parents.NOT__MANAGED, weights.NOT__MANAGED, hrg.NOT__MANAGED)

proc hrgConsensus*(graph:Graph; hrg:Hrg; start:bool; num_samples:int):tuple[parents:NOT__MANAGED; weights:NOT__MANAGED] =
  var parents:Vector_int
  var weights:Vector

  var ret = igraph_hrg_consensus(graph.handle.addr, parents.addr, weights.addr, hrg, start, num_samples)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (parents.NOT__MANAGED, weights.NOT__MANAGED)

proc hrgPredict*(graph:Graph; start:bool; num_samples:int; num_bins:int):tuple[edges:NOT__MANAGED; prob:NOT__MANAGED; hrg:NOT__MANAGED] =
  var edges:Vertex_indices
  var prob:Vector
  var hrg:Hrg

  var ret = igraph_hrg_predict(graph.handle.addr, edges.addr, prob.addr, hrg.addr, start, num_samples, num_bins)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edges.NOT__MANAGED, prob.NOT__MANAGED, hrg.NOT__MANAGED)

proc hrgPredict*(graph:Graph; hrg:Hrg; start:bool; num_samples:int; num_bins:int):tuple[edges:NOT__MANAGED; prob:NOT__MANAGED] =
  var edges:Vertex_indices
  var prob:Vector

  var ret = igraph_hrg_predict(graph.handle.addr, edges.addr, prob.addr, hrg, start, num_samples, num_bins)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edges.NOT__MANAGED, prob.NOT__MANAGED)

proc hrgCreate*(graph:Graph; prob:Vector):NOT__MANAGED =
  var hrg:Hrg

  var ret = igraph_hrg_create(hrg.addr, graph.handle.addr, prob)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (hrg.NOT__MANAGED)

proc hrgResize*(newsize:int):NOT__MANAGED =
  var hrg:Hrg

  var ret = igraph_hrg_resize(hrg.addr, newsize)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (hrg.NOT__MANAGED)

proc hrgResize*(hrg:Hrg; newsize:int) =
  var ret = igraph_hrg_resize(hrg, newsize)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc hrgSize*(hrg:Hrg) =
  var ret = igraph_hrg_size(hrg)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc fromHrgDendrogram*(hrg:Hrg):tuple[graph:Graph; prob:NOT__MANAGED] =
  result = new Graph  var prob:Vector

  var ret = igraph_from_hrg_dendrogram(result.handle.addr, hrg, prob.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (prob.NOT__MANAGED)

proc getAdjacency*(graph:Graph; type:Getadjacency; weights:Edgeweights; loops:Loops):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_get_adjacency(graph.handle.addr, res.addr, type, weights, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc getAdjacencySparse*(graph:Graph; type:Getadjacency; weights:Edgeweights; loops:Loops):NOT__MANAGED =
  var sparsemat:Sparsemat

  var ret = igraph_get_adjacency_sparse(graph.handle.addr, sparsemat.addr, type, weights, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (sparsemat.NOT__MANAGED)

proc getEdgelist*(graph:Graph; bycol:bool):NOT__MANAGED =
  var res:Vector_int

  var ret = igraph_get_edgelist(graph.handle.addr, res.addr, bycol)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc getStochastic*(graph:Graph; column_wise:bool; weights:Edgeweights):NOT__MANAGED =
  var res:Matrix

  var ret = igraph_get_stochastic(graph.handle.addr, res.addr, column_wise, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc getStochasticSparse*(graph:Graph; column_wise:bool; weights:Edgeweights):NOT__MANAGED =
  var sparsemat:Sparsemat

  var ret = igraph_get_stochastic_sparse(graph.handle.addr, sparsemat.addr, column_wise, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (sparsemat.NOT__MANAGED)

proc toDirected*(mode:Todirected):Graph =
  result = new Graph
  var ret = igraph_to_directed(result.handle.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc toDirected*(graph:Graph; mode:Todirected) =
  var ret = igraph_to_directed(graph.handle.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc toUndirected*(mode:Toundirected; edge_attr_comb:Edge_attribute_combination):Graph =
  result = new Graph
  var ret = igraph_to_undirected(result.handle.addr, mode, edge_attr_comb)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc toUndirected*(graph:Graph; mode:Toundirected; edge_attr_comb:Edge_attribute_combination) =
  var ret = igraph_to_undirected(graph.handle.addr, mode, edge_attr_comb)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc readGraphEdgelist*(instream:Infile; n:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_read_graph_edgelist(result.handle.addr, instream, n, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc readGraphNcol*(instream:Infile; predefnames:Vector_str; names:bool; weights:Add_weights; directed:bool):Graph =
  result = new Graph
  var ret = igraph_read_graph_ncol(result.handle.addr, instream, predefnames, names, weights, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc readGraphLgl*(instream:Infile; names:bool; weights:Add_weights; directed:bool):Graph =
  result = new Graph
  var ret = igraph_read_graph_lgl(result.handle.addr, instream, names, weights, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc readGraphPajek*(instream:Infile):Graph =
  result = new Graph
  var ret = igraph_read_graph_pajek(result.handle.addr, instream)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc readGraphGraphml*(instream:Infile; index:int):Graph =
  result = new Graph
  var ret = igraph_read_graph_graphml(result.handle.addr, instream, index)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc readGraphDimacsFlow*(instream:Infile; directed:bool):tuple[graph:Graph; problem:NOT__MANAGED; label:NOT__MANAGED; source:NOT__MANAGED; target:NOT__MANAGED; capacity:NOT__MANAGED] =
  result = new Graph  var problem:Vector_str
  var label:Vector_int
  var source:int
  var target:int
  var capacity:Vector

  var ret = igraph_read_graph_dimacs_flow(result.handle.addr, instream, problem.addr, label.addr, source.addr, target.addr, capacity.addr, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (problem.NOT__MANAGED, label.NOT__MANAGED, source.NOT__MANAGED, target.NOT__MANAGED, capacity.NOT__MANAGED)

proc readGraphGraphdb*(instream:Infile; directed:bool):Graph =
  result = new Graph
  var ret = igraph_read_graph_graphdb(result.handle.addr, instream, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc readGraphGml*(instream:Infile):Graph =
  result = new Graph
  var ret = igraph_read_graph_gml(result.handle.addr, instream)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc readGraphDl*(instream:Infile; directed:bool):Graph =
  result = new Graph
  var ret = igraph_read_graph_dl(result.handle.addr, instream, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc writeGraphEdgelist*(graph:Graph; outstream:Outfile) =
  var ret = igraph_write_graph_edgelist(graph.handle.addr, outstream)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc writeGraphNcol*(graph:Graph; outstream:Outfile; names:cstring; weights:cstring) =
  var ret = igraph_write_graph_ncol(graph.handle.addr, outstream, names, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc writeGraphLgl*(graph:Graph; outstream:Outfile; names:cstring; weights:cstring; isolates:bool) =
  var ret = igraph_write_graph_lgl(graph.handle.addr, outstream, names, weights, isolates)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc writeGraphLeda*(graph:Graph; outstream:Outfile; names:cstring; weights:cstring) =
  var ret = igraph_write_graph_leda(graph.handle.addr, outstream, names, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc writeGraphGraphml*(graph:Graph; outstream:Outfile; prefixattr:bool) =
  var ret = igraph_write_graph_graphml(graph.handle.addr, outstream, prefixattr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc writeGraphPajek*(graph:Graph; outstream:Outfile) =
  var ret = igraph_write_graph_pajek(graph.handle.addr, outstream)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc writeGraphDimacsFlow*(graph:Graph; outstream:Outfile; source:Vertex; target:Vertex; capacity:Vector) =
  var ret = igraph_write_graph_dimacs_flow(graph.handle.addr, outstream, source, target, capacity)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc writeGraphGml*(graph:Graph; outstream:Outfile; options:Write_gml_sw; id:Vector; creator:cstring) =
  var ret = igraph_write_graph_gml(graph.handle.addr, outstream, options, id, creator)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc writeGraphDot*(graph:Graph; outstream:Outfile) =
  var ret = igraph_write_graph_dot(graph.handle.addr, outstream)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc motifsRandesu*(graph:Graph; size:int; cut_prob:Vector):NOT__MANAGED =
  var hist:Vector

  var ret = igraph_motifs_randesu(graph.handle.addr, hist.addr, size, cut_prob)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (hist.NOT__MANAGED)

proc motifsRandesuEstimate*(graph:Graph; size:int; cut_prob:Vector; sample_size:int; sample:Vector_int):NOT__MANAGED =
  var est:int

  var ret = igraph_motifs_randesu_estimate(graph.handle.addr, est.addr, size, cut_prob, sample_size, sample)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (est.NOT__MANAGED)

proc motifsRandesuNo*(graph:Graph; size:int; cut_prob:Vector):NOT__MANAGED =
  var no:int

  var ret = igraph_motifs_randesu_no(graph.handle.addr, no.addr, size, cut_prob)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (no.NOT__MANAGED)

proc dyadCensus*(graph:Graph):tuple[mut:NOT__MANAGED; asym:NOT__MANAGED; null:NOT__MANAGED] =
  var mut:float
  var asym:float
  var null:float

  var ret = igraph_dyad_census(graph.handle.addr, mut.addr, asym.addr, null.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (mut.NOT__MANAGED, asym.NOT__MANAGED, null.NOT__MANAGED)

proc triadCensus*(graph:Graph):NOT__MANAGED =
  var res:Vector

  var ret = igraph_triad_census(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc adjacentTriangles*(graph:Graph; vids:Vertex_selector):NOT__MANAGED =
  var res:Vector

  var ret = igraph_adjacent_triangles(graph.handle.addr, res.addr, vids)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc localScan0*(graph:Graph; weights:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Vector

  var ret = igraph_local_scan_0(graph.handle.addr, res.addr, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc localScan0Them*(us:Graph; them:Graph; weights_them:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Vector

  var ret = igraph_local_scan_0_them(us.handle.addr, them.handle.addr, res.addr, weights_them, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc localScan1Ecount*(graph:Graph; weights:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Vector

  var ret = igraph_local_scan_1_ecount(graph.handle.addr, res.addr, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc localScan1EcountThem*(us:Graph; them:Graph; weights_them:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Vector

  var ret = igraph_local_scan_1_ecount_them(us.handle.addr, them.handle.addr, res.addr, weights_them, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc localScanKEcount*(graph:Graph; k:int; weights:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Vector

  var ret = igraph_local_scan_k_ecount(graph.handle.addr, k, res.addr, weights, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc localScanKEcountThem*(us:Graph; them:Graph; k:int; weights_them:Edgeweights; mode:Neimode):NOT__MANAGED =
  var res:Vector

  var ret = igraph_local_scan_k_ecount_them(us.handle.addr, them.handle.addr, k, res.addr, weights_them, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc localScanNeighborhoodEcount*(graph:Graph; weights:Edgeweights; neighborhoods:Vertexset_list):NOT__MANAGED =
  var res:Vector

  var ret = igraph_local_scan_neighborhood_ecount(graph.handle.addr, res.addr, weights, neighborhoods)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc localScanSubsetEcount*(graph:Graph; weights:Edgeweights; subsets:Vertexset_list):NOT__MANAGED =
  var res:Vector

  var ret = igraph_local_scan_subset_ecount(graph.handle.addr, res.addr, weights, subsets)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc listTriangles*(graph:Graph):NOT__MANAGED =
  var res:Vertex_indices

  var ret = igraph_list_triangles(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc disjointUnion*(left:Graph; right:Graph):Graph =
  result = new Graph
  var ret = igraph_disjoint_union(result.handle.addr, left.handle.addr, right.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc disjointUnionMany*(graphs:Graph_ptr_list):Graph =
  result = new Graph
  var ret = igraph_disjoint_union_many(result.handle.addr, graphs)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc join*(left:Graph; right:Graph):Graph =
  result = new Graph
  var ret = igraph_join(result.handle.addr, left.handle.addr, right.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc union*(left:Graph; right:Graph):tuple[res:Graph; edge_map_left:NOT__MANAGED; edge_map_right:NOT__MANAGED] =
  result = new Graph  var edge_map_left:Index_vector
  var edge_map_right:Index_vector

  var ret = igraph_union(result.handle.addr, left.handle.addr, right.handle.addr, edge_map_left.addr, edge_map_right.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edge_map_left.NOT__MANAGED, edge_map_right.NOT__MANAGED)

proc unionMany*(graphs:Graph_ptr_list):tuple[res:Graph; edgemaps:NOT__MANAGED] =
  result = new Graph  var edgemaps:Vector_int_list

  var ret = igraph_union_many(result.handle.addr, graphs, edgemaps.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edgemaps.NOT__MANAGED)

proc intersection*(left:Graph; right:Graph):tuple[res:Graph; edge_map_left:NOT__MANAGED; edge_map_right:NOT__MANAGED] =
  result = new Graph  var edge_map_left:Index_vector
  var edge_map_right:Index_vector

  var ret = igraph_intersection(result.handle.addr, left.handle.addr, right.handle.addr, edge_map_left.addr, edge_map_right.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edge_map_left.NOT__MANAGED, edge_map_right.NOT__MANAGED)

proc intersectionMany*(graphs:Graph_ptr_list):tuple[res:Graph; edgemaps:NOT__MANAGED] =
  result = new Graph  var edgemaps:Vector_int_list

  var ret = igraph_intersection_many(result.handle.addr, graphs, edgemaps.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edgemaps.NOT__MANAGED)

proc difference*(orig:Graph; sub:Graph):Graph =
  result = new Graph
  var ret = igraph_difference(result.handle.addr, orig.handle.addr, sub.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc complementer*(graph:Graph; loops:bool):Graph =
  result = new Graph
  var ret = igraph_complementer(result.handle.addr, graph.handle.addr, loops)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc compose*(g1:Graph; g2:Graph):tuple[res:Graph; edge_map1:NOT__MANAGED; edge_map2:NOT__MANAGED] =
  result = new Graph  var edge_map1:Index_vector
  var edge_map2:Index_vector

  var ret = igraph_compose(result.handle.addr, g1.handle.addr, g2.handle.addr, edge_map1.addr, edge_map2.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edge_map1.NOT__MANAGED, edge_map2.NOT__MANAGED)

proc inducedSubgraphMap*(graph:Graph; vids:Vertex_selector; impl:Subgraph_impl):tuple[res:Graph; map:NOT__MANAGED; invmap:NOT__MANAGED] =
  result = new Graph  var map:Index_vector
  var invmap:Index_vector

  var ret = igraph_induced_subgraph_map(graph.handle.addrresult.handle.addr, vids, impl, map.addr, invmap.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (map.NOT__MANAGED, invmap.NOT__MANAGED)

proc gomoryHuTree*(graph:Graph; capacity:Edge_capacity):tuple[tree:Graph; flows:NOT__MANAGED] =
  result = new Graph  var flows:Vector

  var ret = igraph_gomory_hu_tree(graph.handle.addrresult.handle.addr, flows.addr, capacity)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (flows.NOT__MANAGED)

proc maxflow*(graph:Graph; source:Vertex; target:Vertex; capacity:Edge_capacity):tuple[value:NOT__MANAGED; flow:NOT__MANAGED; cut:NOT__MANAGED; partition1:NOT__MANAGED; partition2:NOT__MANAGED; stats:NOT__MANAGED] =
  var value:float
  var flow:Vector
  var cut:Edge_indices
  var partition1:Vertex_indices
  var partition2:Vertex_indices
  var stats:Maxflow_stats

  var ret = igraph_maxflow(graph.handle.addr, value.addr, flow.addr, cut.addr, partition1.addr, partition2.addr, source, target, capacity, stats.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (value.NOT__MANAGED, flow.NOT__MANAGED, cut.NOT__MANAGED, partition1.NOT__MANAGED, partition2.NOT__MANAGED, stats.NOT__MANAGED)

proc maxflowValue*(graph:Graph; source:Vertex; target:Vertex; capacity:Edge_capacity):tuple[value:NOT__MANAGED; stats:NOT__MANAGED] =
  var value:float
  var stats:Maxflow_stats

  var ret = igraph_maxflow_value(graph.handle.addr, value.addr, source, target, capacity, stats.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (value.NOT__MANAGED, stats.NOT__MANAGED)

proc mincut*(graph:Graph; capacity:Edge_capacity):tuple[value:NOT__MANAGED; partition1:NOT__MANAGED; partition2:NOT__MANAGED; cut:NOT__MANAGED] =
  var value:float
  var partition1:Vertex_indices
  var partition2:Vertex_indices
  var cut:Edge_indices

  var ret = igraph_mincut(graph.handle.addr, value.addr, partition1.addr, partition2.addr, cut.addr, capacity)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (value.NOT__MANAGED, partition1.NOT__MANAGED, partition2.NOT__MANAGED, cut.NOT__MANAGED)

proc mincutValue*(graph:Graph; capacity:Edge_capacity):NOT__MANAGED =
  var res:float

  var ret = igraph_mincut_value(graph.handle.addr, res.addr, capacity)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc residualGraph*(graph:Graph; capacity:Edge_capacity; flow:Vector):tuple[residual:Graph; residual_capacity:NOT__MANAGED] =
  result = new Graph  var residual_capacity:Edge_capacity

  var ret = igraph_residual_graph(graph.handle.addr, capacityresult.handle.addr, residual_capacity.addr, flow)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (residual_capacity.NOT__MANAGED)

proc reverseResidualGraph*(graph:Graph; capacity:Edge_capacity; flow:Vector):Graph =
  result = new Graph
  var ret = igraph_reverse_residual_graph(graph.handle.addr, capacityresult.handle.addr, flow)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc stMincut*(graph:Graph; source:Vertex; target:Vertex; capacity:Edge_capacity):tuple[value:NOT__MANAGED; cut:NOT__MANAGED; partition1:NOT__MANAGED; partition2:NOT__MANAGED] =
  var value:float
  var cut:Edge_indices
  var partition1:Vertex_indices
  var partition2:Vertex_indices

  var ret = igraph_st_mincut(graph.handle.addr, value.addr, cut.addr, partition1.addr, partition2.addr, source, target, capacity)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (value.NOT__MANAGED, cut.NOT__MANAGED, partition1.NOT__MANAGED, partition2.NOT__MANAGED)

proc stMincutValue*(graph:Graph; source:Vertex; target:Vertex; capacity:Edge_capacity):NOT__MANAGED =
  var res:float

  var ret = igraph_st_mincut_value(graph.handle.addr, res.addr, source, target, capacity)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc stVertexConnectivity*(graph:Graph; source:Vertex; target:Vertex; neighbors:Vconnnei):NOT__MANAGED =
  var res:int

  var ret = igraph_st_vertex_connectivity(graph.handle.addr, res.addr, source, target, neighbors)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc vertexConnectivity*(graph:Graph; checks:bool):NOT__MANAGED =
  var res:int

  var ret = igraph_vertex_connectivity(graph.handle.addr, res.addr, checks)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc stEdgeConnectivity*(graph:Graph; source:Vertex; target:Vertex):NOT__MANAGED =
  var res:int

  var ret = igraph_st_edge_connectivity(graph.handle.addr, res.addr, source, target)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc edgeConnectivity*(graph:Graph; checks:bool):NOT__MANAGED =
  var res:int

  var ret = igraph_edge_connectivity(graph.handle.addr, res.addr, checks)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc edgeDisjointPaths*(graph:Graph; source:Vertex; target:Vertex):NOT__MANAGED =
  var res:int

  var ret = igraph_edge_disjoint_paths(graph.handle.addr, res.addr, source, target)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc vertexDisjointPaths*(graph:Graph; source:Vertex; target:Vertex):NOT__MANAGED =
  var res:int

  var ret = igraph_vertex_disjoint_paths(graph.handle.addr, res.addr, source, target)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc adhesion*(graph:Graph; checks:bool):NOT__MANAGED =
  var res:int

  var ret = igraph_adhesion(graph.handle.addr, res.addr, checks)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc cohesion*(graph:Graph; checks:bool):NOT__MANAGED =
  var res:int

  var ret = igraph_cohesion(graph.handle.addr, res.addr, checks)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc dominatorTree*(graph:Graph; root:Vertex; mode:Neimode):tuple[dom:NOT__MANAGED; domtree:Graph; leftout:NOT__MANAGED] =
  result = new Graph  var leftout:Vertex_indices

  var ret = igraph_dominator_tree(graph.handle.addr, root, dom.addrresult.handle.addr, leftout.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (dom.NOT__MANAGED, leftout.NOT__MANAGED)

proc allStCuts*(graph:Graph; source:Vertex; target:Vertex):tuple[cuts:NOT__MANAGED; partition1s:NOT__MANAGED] =
  var cuts:Edgeset_list
  var partition1s:Vertexset_list

  var ret = igraph_all_st_cuts(graph.handle.addr, cuts.addr, partition1s.addr, source, target)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (cuts.NOT__MANAGED, partition1s.NOT__MANAGED)

proc allStMincuts*(graph:Graph; source:Vertex; target:Vertex; capacity:Edge_capacity):tuple[value:NOT__MANAGED; cuts:NOT__MANAGED; partition1s:NOT__MANAGED] =
  var value:float
  var cuts:Edgeset_list
  var partition1s:Vertexset_list

  var ret = igraph_all_st_mincuts(graph.handle.addr, value.addr, cuts.addr, partition1s.addr, source, target, capacity)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (value.NOT__MANAGED, cuts.NOT__MANAGED, partition1s.NOT__MANAGED)

proc evenTarjanReduction*(graph:Graph):tuple[graphbar:Graph; capacity:NOT__MANAGED] =
  result = new Graph  var capacity:Edge_capacity

  var ret = igraph_even_tarjan_reduction(graph.handle.addrresult.handle.addr, capacity.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (capacity.NOT__MANAGED)

proc isSeparator*(graph:Graph; candidate:Vertex_selector):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_separator(graph.handle.addr, candidate, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc isMinimalSeparator*(graph:Graph; candidate:Vertex_selector):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_minimal_separator(graph.handle.addr, candidate, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc allMinimalStSeparators*(graph:Graph):NOT__MANAGED =
  var separators:Vertexset_list

  var ret = igraph_all_minimal_st_separators(graph.handle.addr, separators.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (separators.NOT__MANAGED)

proc minimumSizeSeparators*(graph:Graph):NOT__MANAGED =
  var separators:Vertexset_list

  var ret = igraph_minimum_size_separators(graph.handle.addr, separators.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (separators.NOT__MANAGED)

proc cohesiveBlocks*(graph:Graph):tuple[blocks:NOT__MANAGED; cohesion:NOT__MANAGED; parent:NOT__MANAGED; blockTree:Graph] =
  result = new Graph
  var ret = igraph_cohesive_blocks(graph.handle.addr, blocks.addr, cohesion.addr, parent.addrresult.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (blocks.NOT__MANAGED, cohesion.NOT__MANAGED, parent.NOT__MANAGED)

proc coreness*(graph:Graph; mode:Neimode):NOT__MANAGED =
  var cores:Vector_int

  var ret = igraph_coreness(graph.handle.addr, cores.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (cores.NOT__MANAGED)

proc isoclass*(graph:Graph):NOT__MANAGED =
  var isoclass:int

  var ret = igraph_isoclass(graph.handle.addr, isoclass.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (isoclass.NOT__MANAGED)

proc isomorphic*(graph1:Graph; graph2:Graph):NOT__MANAGED =
  var iso:bool

  var ret = igraph_isomorphic(graph1.handle.addr, graph2.handle.addr, iso.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (iso.NOT__MANAGED)

proc isoclassSubgraph*(graph:Graph; vids:Vector_int):NOT__MANAGED =
  var isoclass:int

  var ret = igraph_isoclass_subgraph(graph.handle.addr, vids, isoclass.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (isoclass.NOT__MANAGED)

proc isoclassCreate*(size:int; number:int; directed:bool):Graph =
  result = new Graph
  var ret = igraph_isoclass_create(result.handle.addr, size, number, directed)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc isomorphicVf2*(graph1:Graph; graph2:Graph; vertex_color1:Vertex_color; vertex_color2:Vertex_color; edge_color1:Edge_color; edge_color2:Edge_color; node_compat_fn:Isocompat_func; edge_compat_fn:Isocompat_func; extra:Extra):tuple[iso:NOT__MANAGED; map12:NOT__MANAGED; map21:NOT__MANAGED] =
  var iso:bool
  var map12:Index_vector
  var map21:Index_vector

  var ret = igraph_isomorphic_vf2(graph1.handle.addr, graph2.handle.addr, vertex_color1, vertex_color2, edge_color1, edge_color2, iso.addr, map12.addr, map21.addr, node_compat_fn, edge_compat_fn, extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (iso.NOT__MANAGED, map12.NOT__MANAGED, map21.NOT__MANAGED)

proc countIsomorphismsVf2*(graph1:Graph; graph2:Graph; vertex_color1:Vertex_color; vertex_color2:Vertex_color; edge_color1:Edge_color; edge_color2:Edge_color; node_compat_fn:Isocompat_func; edge_compat_fn:Isocompat_func; extra:Extra):NOT__MANAGED =
  var count:int

  var ret = igraph_count_isomorphisms_vf2(graph1.handle.addr, graph2.handle.addr, vertex_color1, vertex_color2, edge_color1, edge_color2, count.addr, node_compat_fn, edge_compat_fn, extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (count.NOT__MANAGED)

proc getIsomorphismsVf2*(graph1:Graph; graph2:Graph; vertex_color1:Vertex_color; vertex_color2:Vertex_color; edge_color1:Edge_color; edge_color2:Edge_color; node_compat_fn:Isocompat_func; edge_compat_fn:Isocompat_func; extra:Extra):NOT__MANAGED =
  var maps:Vector_int_list

  var ret = igraph_get_isomorphisms_vf2(graph1.handle.addr, graph2.handle.addr, vertex_color1, vertex_color2, edge_color1, edge_color2, maps.addr, node_compat_fn, edge_compat_fn, extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (maps.NOT__MANAGED)

proc subisomorphic*(graph1:Graph; graph2:Graph):NOT__MANAGED =
  var iso:bool

  var ret = igraph_subisomorphic(graph1.handle.addr, graph2.handle.addr, iso.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (iso.NOT__MANAGED)

proc subisomorphicVf2*(graph1:Graph; graph2:Graph; vertex_color1:Vertex_color; vertex_color2:Vertex_color; edge_color1:Edge_color; edge_color2:Edge_color; node_compat_fn:Isocompat_func; edge_compat_fn:Isocompat_func; extra:Extra):tuple[iso:NOT__MANAGED; map12:NOT__MANAGED; map21:NOT__MANAGED] =
  var iso:bool
  var map12:Index_vector
  var map21:Index_vector

  var ret = igraph_subisomorphic_vf2(graph1.handle.addr, graph2.handle.addr, vertex_color1, vertex_color2, edge_color1, edge_color2, iso.addr, map12.addr, map21.addr, node_compat_fn, edge_compat_fn, extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (iso.NOT__MANAGED, map12.NOT__MANAGED, map21.NOT__MANAGED)

proc getSubisomorphismsVf2Callback*(graph1:Graph; graph2:Graph; vertex_color1:Vertex_color; vertex_color2:Vertex_color; edge_color1:Edge_color; edge_color2:Edge_color; ishohandler_fn:Isomorphism_func; node_compat_fn:Isocompat_func; edge_compat_fn:Isocompat_func; arg:Extra):tuple[map12:NOT__MANAGED; map21:NOT__MANAGED] =
  var map12:Index_vector
  var map21:Index_vector

  var ret = igraph_get_subisomorphisms_vf2_callback(graph1.handle.addr, graph2.handle.addr, vertex_color1, vertex_color2, edge_color1, edge_color2, map12.addr, map21.addr, ishohandler_fn, node_compat_fn, edge_compat_fn, arg)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (map12.NOT__MANAGED, map21.NOT__MANAGED)

proc countSubisomorphismsVf2*(graph1:Graph; graph2:Graph; vertex_color1:Vertex_color; vertex_color2:Vertex_color; edge_color1:Edge_color; edge_color2:Edge_color; node_compat_fn:Isocompat_func; edge_compat_fn:Isocompat_func; extra:Extra):NOT__MANAGED =
  var count:int

  var ret = igraph_count_subisomorphisms_vf2(graph1.handle.addr, graph2.handle.addr, vertex_color1, vertex_color2, edge_color1, edge_color2, count.addr, node_compat_fn, edge_compat_fn, extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (count.NOT__MANAGED)

proc getSubisomorphismsVf2*(graph1:Graph; graph2:Graph; vertex_color1:Vertex_color; vertex_color2:Vertex_color; edge_color1:Edge_color; edge_color2:Edge_color; node_compat_fn:Isocompat_func; edge_compat_fn:Isocompat_func; extra:Extra):NOT__MANAGED =
  var maps:Vector_int_list

  var ret = igraph_get_subisomorphisms_vf2(graph1.handle.addr, graph2.handle.addr, vertex_color1, vertex_color2, edge_color1, edge_color2, maps.addr, node_compat_fn, edge_compat_fn, extra)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (maps.NOT__MANAGED)

proc canonicalPermutation*(graph:Graph; colors:Vertex_color; sh:Blisssh):tuple[labeling:NOT__MANAGED; info:NOT__MANAGED] =
  var labeling:Index_vector
  var info:Blissinfo

  var ret = igraph_canonical_permutation(graph.handle.addr, colors, labeling.addr, sh, info.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (labeling.NOT__MANAGED, info.NOT__MANAGED)

proc permuteVertices*(graph:Graph; permutation:Index_vector):Graph =
  result = new Graph
  var ret = igraph_permute_vertices(graph.handle.addrresult.handle.addr, permutation)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc isomorphicBliss*(graph1:Graph; graph2:Graph; colors1:Vertex_color; colors2:Vertex_color; sh:Blisssh):tuple[iso:NOT__MANAGED; map12:NOT__MANAGED; map21:NOT__MANAGED; info1:NOT__MANAGED; info2:NOT__MANAGED] =
  var iso:bool
  var map12:Index_vector
  var map21:Index_vector
  var info1:Blissinfo
  var info2:Blissinfo

  var ret = igraph_isomorphic_bliss(graph1.handle.addr, graph2.handle.addr, colors1, colors2, iso.addr, map12.addr, map21.addr, sh, info1.addr, info2.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (iso.NOT__MANAGED, map12.NOT__MANAGED, map21.NOT__MANAGED, info1.NOT__MANAGED, info2.NOT__MANAGED)

proc countAutomorphisms*(graph:Graph; colors:Vertex_color; sh:Blisssh):NOT__MANAGED =
  var info:Blissinfo

  var ret = igraph_count_automorphisms(graph.handle.addr, colors, sh, info.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (info.NOT__MANAGED)

proc automorphismGroup*(graph:Graph; colors:Vertex_color; sh:Blisssh):tuple[generators:NOT__MANAGED; info:NOT__MANAGED] =
  var generators:Vertexset_list
  var info:Blissinfo

  var ret = igraph_automorphism_group(graph.handle.addr, colors, generators.addr, sh, info.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (generators.NOT__MANAGED, info.NOT__MANAGED)

proc subisomorphicLad*(pattern:Graph; target:Graph; domains:Vertexset_list; induced:bool; time_limit:int):tuple[iso:NOT__MANAGED; map:NOT__MANAGED; maps:NOT__MANAGED] =
  var iso:bool
  var map:Index_vector
  var maps:Vector_int_list

  var ret = igraph_subisomorphic_lad(pattern.handle.addr, target.handle.addr, domains, iso.addr, map.addr, maps.addr, induced, time_limit)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (iso.NOT__MANAGED, map.NOT__MANAGED, maps.NOT__MANAGED)

proc simplifyAndColorize*(graph:Graph):tuple[res:Graph; vertex_color:NOT__MANAGED; edge_color:NOT__MANAGED] =
  result = new Graph  var vertex_color:Vector_int
  var edge_color:Vector_int

  var ret = igraph_simplify_and_colorize(graph.handle.addrresult.handle.addr, vertex_color.addr, edge_color.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertex_color.NOT__MANAGED, edge_color.NOT__MANAGED)

proc graphCount*(n:int; directed:bool):NOT__MANAGED =
  var count:int

  var ret = igraph_graph_count(n, directed, count.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (count.NOT__MANAGED)

proc isMatching*(graph:Graph; types:Bipartite_types; matching:Index_vector):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_matching(graph.handle.addr, types, matching, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc isMaximalMatching*(graph:Graph; types:Bipartite_types; matching:Index_vector):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_maximal_matching(graph.handle.addr, types, matching, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc maximumBipartiteMatching*(graph:Graph; types:Bipartite_types; weights:Edgeweights; eps:float):tuple[matching_size:NOT__MANAGED; matching_weight:NOT__MANAGED; matching:NOT__MANAGED] =
  var matching_size:int
  var matching_weight:float
  var matching:Index_vector

  var ret = igraph_maximum_bipartite_matching(graph.handle.addr, types, matching_size.addr, matching_weight.addr, matching.addr, weights, eps)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (matching_size.NOT__MANAGED, matching_weight.NOT__MANAGED, matching.NOT__MANAGED)

proc adjacencySpectralEmbedding*(graph:Graph; no:int; weights:Edgeweights; which:Eigenwhichpos; scaled:bool; cvec:Vector):tuple[X:NOT__MANAGED; Y:NOT__MANAGED; D:NOT__MANAGED; options:NOT__MANAGED] =
  var X:Matrix
  var Y:Matrix
  var D:Vector
  var options:Arpackopt

  var ret = igraph_adjacency_spectral_embedding(graph.handle.addr, no, weights, which, scaled, X.addr, Y.addr, D.addr, cvec, options.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (X.NOT__MANAGED, Y.NOT__MANAGED, D.NOT__MANAGED, options.NOT__MANAGED)

proc adjacencySpectralEmbedding*(graph:Graph; no:int; weights:Edgeweights; which:Eigenwhichpos; scaled:bool; cvec:Vector; options:Arpackopt):tuple[X:NOT__MANAGED; Y:NOT__MANAGED; D:NOT__MANAGED] =
  var X:Matrix
  var Y:Matrix
  var D:Vector

  var ret = igraph_adjacency_spectral_embedding(graph.handle.addr, no, weights, which, scaled, X.addr, Y.addr, D.addr, cvec, options)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (X.NOT__MANAGED, Y.NOT__MANAGED, D.NOT__MANAGED)

proc laplacianSpectralEmbedding*(graph:Graph; no:int; weights:Edgeweights; which:Eigenwhichpos; type:Lsetype; scaled:bool):tuple[X:NOT__MANAGED; Y:NOT__MANAGED; D:NOT__MANAGED; options:NOT__MANAGED] =
  var X:Matrix
  var Y:Matrix
  var D:Vector
  var options:Arpackopt

  var ret = igraph_laplacian_spectral_embedding(graph.handle.addr, no, weights, which, type, scaled, X.addr, Y.addr, D.addr, options.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (X.NOT__MANAGED, Y.NOT__MANAGED, D.NOT__MANAGED, options.NOT__MANAGED)

proc laplacianSpectralEmbedding*(graph:Graph; no:int; weights:Edgeweights; which:Eigenwhichpos; type:Lsetype; scaled:bool; options:Arpackopt):tuple[X:NOT__MANAGED; Y:NOT__MANAGED; D:NOT__MANAGED] =
  var X:Matrix
  var Y:Matrix
  var D:Vector

  var ret = igraph_laplacian_spectral_embedding(graph.handle.addr, no, weights, which, type, scaled, X.addr, Y.addr, D.addr, options)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (X.NOT__MANAGED, Y.NOT__MANAGED, D.NOT__MANAGED)

proc eigenAdjacency*(graph:Graph; algorithm:Eigenalgo; which:Eigenwhich):tuple[options:NOT__MANAGED; storage:NOT__MANAGED; values:NOT__MANAGED; vectors:NOT__MANAGED; cmplxvalues:NOT__MANAGED; cmplxvectors:NOT__MANAGED] =
  var options:Arpackopt
  var storage:Arpackstorage
  var values:Vector
  var vectors:Matrix
  var cmplxvalues:Vector_complex
  var cmplxvectors:Matrix_complex

  var ret = igraph_eigen_adjacency(graph.handle.addr, algorithm, which, options.addr, storage.addr, values.addr, vectors.addr, cmplxvalues.addr, cmplxvectors.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (options.NOT__MANAGED, storage.NOT__MANAGED, values.NOT__MANAGED, vectors.NOT__MANAGED, cmplxvalues.NOT__MANAGED, cmplxvectors.NOT__MANAGED)

proc eigenAdjacency*(graph:Graph; algorithm:Eigenalgo; which:Eigenwhich; options:Arpackopt; storage:Arpackstorage):tuple[values:NOT__MANAGED; vectors:NOT__MANAGED; cmplxvalues:NOT__MANAGED; cmplxvectors:NOT__MANAGED] =
  var values:Vector
  var vectors:Matrix
  var cmplxvalues:Vector_complex
  var cmplxvectors:Matrix_complex

  var ret = igraph_eigen_adjacency(graph.handle.addr, algorithm, which, options, storage, values.addr, vectors.addr, cmplxvalues.addr, cmplxvectors.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (values.NOT__MANAGED, vectors.NOT__MANAGED, cmplxvalues.NOT__MANAGED, cmplxvectors.NOT__MANAGED)

proc powerLawFit*(data:Vector; xmin:float; force_continuous:bool):NOT__MANAGED =
  var res:Plfit

  var ret = igraph_power_law_fit(data, res.addr, xmin, force_continuous)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc sir*(graph:Graph; beta:float; gamma:float; no_sim:int):NOT__MANAGED =
  var res:Sir_list

  var ret = igraph_sir(graph.handle.addr, beta, gamma, no_sim, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc runningMean*(data:Vector; binwidth:int):NOT__MANAGED =
  var res:Vector

  var ret = igraph_running_mean(data, res.addr, binwidth)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc randomSample*(l:int; h:int; length:int):NOT__MANAGED =
  var res:Vector_int

  var ret = igraph_random_sample(res.addr, l, h, length)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc convexHull*(data:Matrix):tuple[resverts:NOT__MANAGED; rescoords:NOT__MANAGED] =
  var resverts:Index_vector
  var rescoords:Matrix

  var ret = igraph_convex_hull(data, resverts.addr, rescoords.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (resverts.NOT__MANAGED, rescoords.NOT__MANAGED)

proc dimSelect*(sv:Vector):NOT__MANAGED =
  var dim:int

  var ret = igraph_dim_select(sv, dim.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (dim.NOT__MANAGED)

proc almostEquals*(a:float; b:float; eps:float):bool =
  return ( igraph_almost_equals(a, b, eps) ).bool


proc cmpEpsilon*(a:float; b:float; eps:float) =
  var ret = igraph_cmp_epsilon(a, b, eps)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc eigenMatrix*(A:Matrix; sA:Sparsemat; fun:Arpackfunc; n:cint; extra:Extra; algorithm:Eigenalgo; which:Eigenwhich):tuple[options:NOT__MANAGED; storage:NOT__MANAGED; values:NOT__MANAGED; vectors:NOT__MANAGED] =
  var options:Arpackopt
  var storage:Arpackstorage
  var values:Vector_complex
  var vectors:Matrix_complex

  var ret = igraph_eigen_matrix(A, sA, fun, n, extra, algorithm, which, options.addr, storage.addr, values.addr, vectors.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (options.NOT__MANAGED, storage.NOT__MANAGED, values.NOT__MANAGED, vectors.NOT__MANAGED)

proc eigenMatrix*(A:Matrix; sA:Sparsemat; fun:Arpackfunc; n:cint; extra:Extra; algorithm:Eigenalgo; which:Eigenwhich; options:Arpackopt; storage:Arpackstorage):tuple[values:NOT__MANAGED; vectors:NOT__MANAGED] =
  var values:Vector_complex
  var vectors:Matrix_complex

  var ret = igraph_eigen_matrix(A, sA, fun, n, extra, algorithm, which, options, storage, values.addr, vectors.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (values.NOT__MANAGED, vectors.NOT__MANAGED)

proc eigenMatrixSymmetric*(A:Matrix; sA:Sparsemat; fun:Arpackfunc; n:cint; extra:Extra; algorithm:Eigenalgo; which:Eigenwhich):tuple[options:NOT__MANAGED; storage:NOT__MANAGED; values:NOT__MANAGED; vectors:NOT__MANAGED] =
  var options:Arpackopt
  var storage:Arpackstorage
  var values:Vector
  var vectors:Matrix

  var ret = igraph_eigen_matrix_symmetric(A, sA, fun, n, extra, algorithm, which, options.addr, storage.addr, values.addr, vectors.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (options.NOT__MANAGED, storage.NOT__MANAGED, values.NOT__MANAGED, vectors.NOT__MANAGED)

proc eigenMatrixSymmetric*(A:Matrix; sA:Sparsemat; fun:Arpackfunc; n:cint; extra:Extra; algorithm:Eigenalgo; which:Eigenwhich; options:Arpackopt; storage:Arpackstorage):tuple[values:NOT__MANAGED; vectors:NOT__MANAGED] =
  var values:Vector
  var vectors:Matrix

  var ret = igraph_eigen_matrix_symmetric(A, sA, fun, n, extra, algorithm, which, options, storage, values.addr, vectors.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (values.NOT__MANAGED, vectors.NOT__MANAGED)

proc solveLsap*(c:Matrix; n:int):NOT__MANAGED =
  var p:Vector_int

  var ret = igraph_solve_lsap(c, n, p.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (p.NOT__MANAGED)

proc isEulerian*(graph:Graph):tuple[has_path:NOT__MANAGED; has_cycle:NOT__MANAGED] =
  var has_path:bool
  var has_cycle:bool

  var ret = igraph_is_eulerian(graph.handle.addr, has_path.addr, has_cycle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (has_path.NOT__MANAGED, has_cycle.NOT__MANAGED)

proc eulerianPath*(graph:Graph):tuple[edge_res:NOT__MANAGED; vertex_res:NOT__MANAGED] =
  var edge_res:Edge_indices
  var vertex_res:Vertex_indices

  var ret = igraph_eulerian_path(graph.handle.addr, edge_res.addr, vertex_res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edge_res.NOT__MANAGED, vertex_res.NOT__MANAGED)

proc eulerianCycle*(graph:Graph):tuple[edge_res:NOT__MANAGED; vertex_res:NOT__MANAGED] =
  var edge_res:Edge_indices
  var vertex_res:Vertex_indices

  var ret = igraph_eulerian_cycle(graph.handle.addr, edge_res.addr, vertex_res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (edge_res.NOT__MANAGED, vertex_res.NOT__MANAGED)

proc fundamentalCycles*(graph:Graph; start:Vertex; bfs_cutoff:int; weights:Edgeweights):NOT__MANAGED =
  var basis:Edgeset_list

  var ret = igraph_fundamental_cycles(graph.handle.addr, basis.addr, start, bfs_cutoff, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (basis.NOT__MANAGED)

proc minimumCycleBasis*(graph:Graph; bfs_cutoff:int; complete:bool; use_cycle_order:bool; weights:Edgeweights):NOT__MANAGED =
  var basis:Edgeset_list

  var ret = igraph_minimum_cycle_basis(graph.handle.addr, basis.addr, bfs_cutoff, complete, use_cycle_order, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (basis.NOT__MANAGED)

proc isTree*(graph:Graph; mode:Neimode):tuple[res:NOT__MANAGED; root:NOT__MANAGED] =
  var res:bool
  var root:Vertex

  var ret = igraph_is_tree(graph.handle.addr, res.addr, root.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, root.NOT__MANAGED)

proc isForest*(graph:Graph; mode:Neimode):tuple[res:NOT__MANAGED; roots:NOT__MANAGED] =
  var res:bool
  var roots:Vertex_indices

  var ret = igraph_is_forest(graph.handle.addr, res.addr, roots.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED, roots.NOT__MANAGED)

proc fromPrufer*(prufer:Index_vector):Graph =
  result = new Graph
  var ret = igraph_from_prufer(result.handle.addr, prufer)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc toPrufer*(graph:Graph):NOT__MANAGED =
  var prufer:Index_vector

  var ret = igraph_to_prufer(graph.handle.addr, prufer.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (prufer.NOT__MANAGED)

proc treeFromParentVector*(parents:Index_vector; type:Tree_mode):Graph =
  result = new Graph
  var ret = igraph_tree_from_parent_vector(result.handle.addr, parents, type)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc isComplete*(graph:Graph):NOT__MANAGED =
  var res:bool

  var ret = igraph_is_complete(graph.handle.addr, res.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc minimumSpanningTree*(graph:Graph; weights:Edgeweights):NOT__MANAGED =
  var res:Edge_indices

  var ret = igraph_minimum_spanning_tree(graph.handle.addr, res.addr, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc minimumSpanningTreeUnweighted*(graph:Graph):Graph =
  result = new Graph
  var ret = igraph_minimum_spanning_tree_unweighted(graph.handle.addrresult.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc minimumSpanningTreePrim*(graph:Graph; weights:Edgeweights):Graph =
  result = new Graph
  var ret = igraph_minimum_spanning_tree_prim(graph.handle.addrresult.handle.addr, weights)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc randomSpanningTree*(graph:Graph; vid:Vertex):NOT__MANAGED =
  var res:Edge_indices

  var ret = igraph_random_spanning_tree(graph.handle.addr, res.addr, vid)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (res.NOT__MANAGED)

proc treeGame*(n:int; directed:bool; method:Random_tree_method):Graph =
  result = new Graph
  var ret = igraph_tree_game(result.handle.addr, n, directed, method)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc vertexColoringGreedy*(graph:Graph; heuristic:Greedy_coloring_heuristic):NOT__MANAGED =
  var colors:Vertex_color

  var ret = igraph_vertex_coloring_greedy(graph.handle.addr, colors.addr, heuristic)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (colors.NOT__MANAGED)

proc deterministicOptimalImitation*(graph:Graph; vid:Vertex; optimality:Optimality; quantities:All_vertex_qty; mode:Neimode):NOT__MANAGED =
  var strategies:Vector_int

  var ret = igraph_deterministic_optimal_imitation(graph.handle.addr, vid, optimality, quantities, strategies.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (strategies.NOT__MANAGED)

proc deterministicOptimalImitation*(graph:Graph; vid:Vertex; optimality:Optimality; quantities:All_vertex_qty; strategies:Vector_int; mode:Neimode) =
  var ret = igraph_deterministic_optimal_imitation(graph.handle.addr, vid, optimality, quantities, strategies, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc moranProcess*(graph:Graph; weights:Edgeweights; mode:Neimode):tuple[quantities:NOT__MANAGED; strategies:NOT__MANAGED] =
  var quantities:All_vertex_qty
  var strategies:Vector_int

  var ret = igraph_moran_process(graph.handle.addr, weights, quantities.addr, strategies.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (quantities.NOT__MANAGED, strategies.NOT__MANAGED)

proc moranProcess*(graph:Graph; weights:Edgeweights; quantities:All_vertex_qty; strategies:Vector_int; mode:Neimode) =
  var ret = igraph_moran_process(graph.handle.addr, weights, quantities, strategies, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc rouletteWheelImitation*(graph:Graph; vid:Vertex; is_local:bool; quantities:All_vertex_qty; mode:Neimode):NOT__MANAGED =
  var strategies:Vector_int

  var ret = igraph_roulette_wheel_imitation(graph.handle.addr, vid, is_local, quantities, strategies.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (strategies.NOT__MANAGED)

proc rouletteWheelImitation*(graph:Graph; vid:Vertex; is_local:bool; quantities:All_vertex_qty; strategies:Vector_int; mode:Neimode) =
  var ret = igraph_roulette_wheel_imitation(graph.handle.addr, vid, is_local, quantities, strategies, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc stochasticImitation*(graph:Graph; vid:Vertex; algo:Imitate_algorithm; quantities:All_vertex_qty; mode:Neimode):NOT__MANAGED =
  var strategies:Vector_int

  var ret = igraph_stochastic_imitation(graph.handle.addr, vid, algo, quantities, strategies.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (strategies.NOT__MANAGED)

proc stochasticImitation*(graph:Graph; vid:Vertex; algo:Imitate_algorithm; quantities:All_vertex_qty; strategies:Vector_int; mode:Neimode) =
  var ret = igraph_stochastic_imitation(graph.handle.addr, vid, algo, quantities, strategies, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc convergenceDegree*(graph:Graph):tuple[result:NOT__MANAGED; in:NOT__MANAGED; out:NOT__MANAGED] =
  var result:Vector
  var in:Vector
  var out:Vector

  var ret = igraph_convergence_degree(graph.handle.addr, result.addr, in.addr, out.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (result.NOT__MANAGED, in.NOT__MANAGED, out.NOT__MANAGED)

proc hasAttributeTable*():bool =
  return ( igraph_has_attribute_table() ).bool


proc progress*(message:cstring; percent:float; data:Extra) =
  var ret = igraph_progress(message, percent, data)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc status*(message:cstring; data:Extra) =
  var ret = igraph_status(message, data)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc strerror*(igraph_errno:Error):string =
  return ( igraph_strerror(igraph_errno) ).string


proc expandPathToPairs*():NOT__MANAGED =
  var path:Vertex_indices

  var ret = igraph_expand_path_to_pairs(path.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (path.NOT__MANAGED)

proc expandPathToPairs*(path:Vertex_indices) =
  var ret = igraph_expand_path_to_pairs(path)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc invalidateCache*(graph:Graph) =
  var ret = igraph_invalidate_cache(graph.handle.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")

proc vertexPathFromEdgePath*(graph:Graph; start:Vertex; edge_path:Edge_indices; mode:Neimode):NOT__MANAGED =
  var vertex_path:Vertex_indices

  var ret = igraph_vertex_path_from_edge_path(graph.handle.addr, start, edge_path, vertex_path.addr, mode)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return (vertex_path.NOT__MANAGED)

proc version*():tuple[version_string:string; major:int; minor:int; subminor:int] =
  var version_string:cstring
  var major:cint
  var minor:cint
  var subminor:cint

  var ret = igraph_version(version_string.addr, major.addr, minor.addr, subminor.addr)
  if ret != Igraphsuccess:
    raise newException(ValueError, &"error while calling the function: {ret}")  return ($version_string, major.int, minor.int, subminor.int)


