#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define Nmax 600

void producto(float x, float y, float* z) {
    *z = x*y;
}

int main() {
    float A[Nmax][Nmax], B[Nmax][Nmax], C[Nmax][Nmax], t, r;
    int i,j,k;
    struct timeval inicio, final;
    double tiempo = 0;

    gettimeofday(&inicio, NULL); /* Codigo a medir */
    for (i=0; i<Nmax; i++) {
        for (j=0; j<Nmax; j++) {
            A[i][j] = (i+j)/(j+1.1);
            B[i][j] = (i-j)/(j+2.1);
        }
    }
    for (i=0; i<Nmax; i++) {
        for (j=0; j<Nmax; j++) {
            t = 0;
            for (k=0; k<Nmax; k++) {
                producto(A[i][k],B[k][j],&r);
                t+=r;
            }
            C[i][j] = t;
        }
    }
    gettimeofday(&final,  NULL); /* Fin del codigo */

    tiempo = (final.tv_sec-inicio.tv_sec+(final.tv_usec-inicio.tv_usec)/1.e6);

    printf("\n-> Tiempo: %f\n\n", tiempo);

    return 0;
}
