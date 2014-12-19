#include <stdio.h>
#include <sys/time.h>

#define N 100000000

double res[N];

main() {
    int i;
    double tiempo;
    struct timeval inicio, final;
    double x;

    gettimeofday(&inicio, NULL); /* Codigo a medir */

    for(i=0;i<N;i++) res[i]=0.0005*i;
    for(i=0;i<N;i++) {
        x=res[i];
        if (x<10.0e6) x=x*x+0.0005;
        else x=x-1000;
        res[i]+=x;
    }
    printf("resultado= %e\t%f\n",res[N-1],x);

    gettimeofday(&final,  NULL); /* Fin del codigo */

    tiempo = (final.tv_sec-inicio.tv_sec+(final.tv_usec-inicio.tv_usec)/1.e6);
    
    printf("\n-> Tiempo: %f\n\n", tiempo);
}
