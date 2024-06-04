// gcc -I/usr/include/igraph -ligraph ex4_6_neighbors.c -o ex4_6_neighbors
#include <igraph.h>

int main(void) {

    igraph_t g;
    igraph_vector_int_t v;

    igraph_vector_int_init(&v, 0);
    igraph_small(&g, 4, IGRAPH_DIRECTED, 0,1, 1,2, 2,3, 2,2, -1);

    igraph_neighbors(&g, &v, 2, IGRAPH_OUT);
    igraph_vector_int_sort(&v);
    igraph_vector_int_print(&v);

    igraph_neighbors(&g, &v, 2, IGRAPH_IN);
    igraph_vector_int_sort(&v);
    igraph_vector_int_print(&v);

    igraph_neighbors(&g, &v, 2, IGRAPH_ALL);
    igraph_vector_int_sort(&v);
    igraph_vector_int_print(&v);

    igraph_vector_int_destroy(&v);
    igraph_destroy(&g);
    return 0;
}