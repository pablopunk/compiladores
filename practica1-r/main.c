
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define Nmax 600

void producto(float x, float y, float* z)
{
  *z = x * y;
}

int main()
{
  struct timeval inicio, final;
  double tiempo;
  int i, j, k;
  float A[Nmax][Nmax], B[Nmax][Nmax], C[Nmax][Nmax], t, r;
  FILE* fp = fopen("/dev/null", "w");

  gettimeofday(&inicio, NULL); // inicio de codigo a medir

  for (i = 0; i < Nmax; i++) /* valores de las matrices */
    for (j = 0; j < Nmax; j++) {
      A[i][j] = (i+j)/(j+1.1);
      B[i][j] = (i-j)/(j+2.1);
    }

  for (i = 0; i < Nmax; i++) /* producto matricial */
    for (j = 0; j < Nmax; j++) {
      t = 0;
      for (k = 0; k < Nmax; k++) {
        producto(A[i][k], B[k][j], &r);
        t += r;
      }
      C[i][j] = t;
    }

  gettimeofday(&final, NULL); // fin de codigo a medir

  tiempo = (final.tv_sec - inicio.tv_sec + (final.tv_usec - inicio.tv_usec)/1.e6);

  printf("%f\n", C[i][j]); // uso un resultado para evitar optimizaciones forzosas
  printf("%.f", tiempo*1e6);

  fclose(fp);

  return 0;
}
