// gcc -I/usr/include/igraph -ligraph ex11_1_igraph_vs_nonadj.c -o ex11_1_igraph_vs_nonadj
#include <igraph.h>

int main(void) {

    igraph_t g;
    igraph_vs_t vs;
    igraph_vit_t vit;
    igraph_integer_t size;

    /* empty graph, all vertices */
    igraph_empty(&g, 10, IGRAPH_DIRECTED);
    igraph_vs_nonadj(&vs, 0, IGRAPH_ALL);
    igraph_vs_size(&g, &vs, &size);
    printf("%" IGRAPH_PRId " ", size);
    igraph_vit_create(&g, vs, &vit);
    while (!IGRAPH_VIT_END(vit)) {
        printf("%" IGRAPH_PRId " ", IGRAPH_VIT_GET(vit));
        IGRAPH_VIT_NEXT(vit);
    }
    printf("\n");

    igraph_vit_destroy(&vit);
    igraph_vs_destroy(&vs);
    igraph_destroy(&g);

    /* full graph, no vertices */
    igraph_full(&g, 10, IGRAPH_UNDIRECTED, IGRAPH_LOOPS);
    igraph_vs_nonadj(&vs, 0, IGRAPH_ALL);
    igraph_vit_create(&g, vs, &vit);
    while (!IGRAPH_VIT_END(vit)) {
        printf("%" IGRAPH_PRId " ", IGRAPH_VIT_GET(vit));
        IGRAPH_VIT_NEXT(vit);
    }
    printf("\n");

    igraph_vit_destroy(&vit);
    igraph_vs_destroy(&vs);
    igraph_destroy(&g);


    return 0;
}