#!/bin/bash

# archivo CSV
echo "N;O1;O1-funroll" > resultados/3.csv

## compilacion
# -O1
gcc -O1 -S main3.c -o O1/main3.asm
gcc -O1 main3.c -o O1/bin3
# -O1 -funroll-loops
gcc -O1 -funroll-loops -S main3.c -o O1/main3-funroll.asm
gcc -O1 -funroll-loops main3.c -o O1/bin3-funroll

# resultados
N=1000000 # valor inicial de N, se incrementa en cada iteracion del bucle
for i in `seq 1 5`;
do
  echo "Ejecutando para N=$N.."
  echo -n "N=$N;" >> resultados/3.csv
  ./O1/bin3 $N | xargs echo -n >> resultados/3.csv
  echo -n ";" >> resultados/3.csv
  ./O1/bin3-funroll $N | xargs echo >> resultados/3.csv
  let N=N*10
done

echo; echo " resultados/3.cs:"; echo
cat resultados/3.csv
