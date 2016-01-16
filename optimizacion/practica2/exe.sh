#!/bin/bash

# compilar
gcc main.c -o bin/O0/main -O0
gcc main.c -o bin/O1/main -O1
gcc main.c -o bin/O2/main -O2
gcc main.c -o bin/O3/main -O3

echo "N;O0 no optimizado;O0 optimizado;O1 no optimizado;O1 optimizado;O2 no optimizado; O2 optimizado;O3 no optimizado;O3 optimizado" > resultados.csv

T="$(date +%s)"
# ejecutar
N=100 # valor inicial de N, se incrementa en cada iteracion del bucle
for i in `seq 1 4`;
do
  echo "Ejecutando para N=$N.."
  echo -n "N=$N" >> resultados.csv
  ./bin/O0/main $N | xargs echo -n >> resultados.csv
  ./bin/O1/main $N | xargs echo -n >> resultados.csv
  ./bin/O2/main $N | xargs echo -n >> resultados.csv
  ./bin/O3/main $N | xargs echo    >> resultados.csv # \n
  let N=N+100
done
T="$(($(date +%s)-T))"
echo "Ejecutado en $T segundos"
