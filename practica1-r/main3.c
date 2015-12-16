
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <sys/time.h>

int N = 10000;

int main(int argc, char ** argv)
{
  struct timeval inicio, final;
  double tiempo, x;
  int i;
  FILE* fp = fopen("/dev/null", "w");

  argc--; argv++;
  if ( argv[0] && isdigit(argv[0][0]) ) {
    N = atoi(argv[0]);
  }

  double* res = (double*) malloc(N*sizeof(double));
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

  fprintf(fp, "%f\n", res[N-1]); // uso un resultado para evitar optimizaciones forzosas
  printf("%.f",tiempo*1e6);

  fclose(fp);

  return 0;
}
