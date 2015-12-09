
#include <stdio.h>
#include <sys/time.h>

#define N 100000000

double res[N];

int main()
{
  struct timeval inicio, final;
  double tiempo, x;
  int i;

  gettimeofday(&inicio, NULL); // inicio de codigo a medir

  for (i=0; i<N; i++)
    res[i]=0.0007*i;
  for (i=0; i<N; i++) {
    x = res[i];
    if (x < 10.0e6) x = x*x + 0.0005;
    else x = x-1000;
    res[i] += x;
  }

  gettimeofday(&final, NULL); // fin de codigo a medir

  tiempo = (final.tv_sec - inicio.tv_sec + (final.tv_usec - inicio.tv_usec)/1.e6);

  printf("Resultado: %e\nTiempo: %f\n", res[N-1], tiempo);

  return 0;
}
