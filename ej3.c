#include <stdio.h>

#define Nmax 10

main() {
    int i,j,k,t;

    j=1; t=1;

    for(i=0;i<Nmax;i++) {
        t++;
        j=j+i;
        k=j-t;
        k=k+t;
        j=j+k;
        printf("Resultado = %d\n",j);
    }
}
