
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <ctype.h>

#define ITER 100

int main(int argc, char ** argv)
{
  struct timeval inicio, final;
  double tiempo_sin_optimizar, tiempo_optimizado;
  int N = 100;
  register int i, j, k, l;

  argc--; argv++; // me salto el nombre del programa
  if ( argv[0] && isdigit(argv[0][0]) ) {
    N = atoi(argv[0]);
  }

  float a[N][N], b[N][N], c[N][N];
  // dinamico
  // float ** a = (float**) malloc(N*sizeof(float*));
  // float ** b = (float**) malloc(N*sizeof(float*));
  // float ** c = (float**) malloc(N*sizeof(float*));
  // for (i=0; i<N; i++) {
  //   a[i] = (float*) malloc(N*sizeof(float));
  //   b[i] = (float*) malloc(N*sizeof(float));
  //   c[i] = (float*) malloc(N*sizeof(float));
  // }
  float aux;
  // enfriar cache
  for (l=0; l<ITER; l++)
    for (i=0; i<N; i++)
      for (j=0; j<N; j++)
        for (k=0; k<N; k++) {
          aux = c[k][i];
          aux = a[k][j];
          aux = b[j][i];
        }
  gettimeofday(&inicio, NULL); // inicio de codigo a medir
  for (l=0; l<ITER; l++)
    for (i=0; i<N; i++)
      for (j=0; j<N; j++)
        for (k=0; k<N; k++)
          c[k][i] += a[k][j] * b[j][i];
  gettimeofday(&final, NULL); // fin de codigo a medir

  tiempo_sin_optimizar = (final.tv_sec - inicio.tv_sec + (final.tv_usec - inicio.tv_usec)/1.e6);

  gettimeofday(&inicio, NULL); // inicio de codigo a medir
  for (l=0; l<ITER; l++)
    for (i=0; i<N; i+=2)
      for (j=0; j<N; j+=2)
        for (k=0; k<N; k++) {
            c[k][i] += a[k][j] * b[j][i] + a[k][j+1] * b[j+1][i];
            c[k][i+1] += a[k][j] * b[j][i+1] + a[k][j+1] * b[j+1][i+1];
        }
  gettimeofday(&final, NULL); // fin de codigo a medir

  tiempo_optimizado = (final.tv_sec - inicio.tv_sec + (final.tv_usec - inicio.tv_usec)/1.e6);


  printf(";%.0f;%.0f", tiempo_sin_optimizar*1e6, tiempo_optimizado*1e6);
}
