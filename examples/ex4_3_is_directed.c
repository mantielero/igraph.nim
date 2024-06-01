// gcc -I/usr/include/igraph -ligraph ex4_3_is_directed.c -o ex4_3_is_directed
#include <igraph.h>

int main(void) {

    igraph_t g;

    igraph_empty(&g, 0, 0);
    if (igraph_is_directed(&g)) {
        return 1;
    }
    igraph_destroy(&g);

    igraph_empty(&g, 0, 1);
    if (!igraph_is_directed(&g)) {
        return 2;
    }
    igraph_destroy(&g);

    return 0;
}