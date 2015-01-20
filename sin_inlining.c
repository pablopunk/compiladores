#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define N 10000
#define ITER 100

int i,j;
static float x[N],y[N],z[N];

void add(float x, float y, float* z)
{
	*z = x+y;
}

int main() {
    struct timeval inicio, final;
    double tiempo = 0;

    for(j=0; j<ITER; j++)
    	for(i=0; i<N; i++)
    		add(x[i],y[i],&z[i]);

    gettimeofday(&inicio, NULL); /* Codigo a medir */

    for(j=0; j<ITER; j++)
    	for(i=0; i<N; i++)
    		add(x[i],y[i],&z[i]);
    
    gettimeofday(&final,  NULL); /* Fin del codigo */

    tiempo = (final.tv_sec-inicio.tv_sec+(final.tv_usec-inicio.tv_usec)/1.e6);

    printf("\n-> Tiempo: %f\n\n", tiempo);

    return 0;
}
