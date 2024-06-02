// gcc -I/usr/include/igraph -ligraph ex4_4_get_eid.c -o ex4_4_get_eid
#include <igraph.h>

int main(void) {
    igraph_t g;
    igraph_integer_t eid;
    igraph_vector_int_t hist;
    igraph_integer_t i;

    /* DIRECTED */

    igraph_star(&g, 10, IGRAPH_STAR_OUT, 0);

    igraph_vector_int_init(&hist, 9);

    for (i = 1; i < 10; i++) {
        igraph_get_eid(&g, &eid, 0, i, IGRAPH_DIRECTED, /*error=*/ true);
        VECTOR(hist)[ eid ] = 1;
    }

    igraph_vector_int_print(&hist);

    igraph_vector_int_destroy(&hist);
    igraph_destroy(&g);

    /* UNDIRECTED */

    igraph_star(&g, 10, IGRAPH_STAR_UNDIRECTED, 0);

    igraph_vector_int_init(&hist, 9);

    for (i = 1; i < 10; i++) {
        igraph_get_eid(&g, &eid, 0, i, IGRAPH_UNDIRECTED, /*error=*/ true);
        VECTOR(hist)[ eid ] += 1;
        igraph_get_eid(&g, &eid, i, 0, IGRAPH_DIRECTED, /*error=*/ true);
        VECTOR(hist)[ eid ] += 1;
    }
    igraph_vector_int_print(&hist);

    igraph_vector_int_destroy(&hist);
    igraph_destroy(&g);

    return 0;
}