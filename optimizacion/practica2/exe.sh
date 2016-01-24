#!/bin/bash

#variables
o_list=`seq 0 3`
n_list=`seq 100 100 400`
NPROC=0 # numero de procesos arrancados
NR_CPUS=4 # cpus maximas

# atrapar CTRL+C y llamar a la funcion
trap ctrl_c INT

function ctrl_c() {
  killall main
  rm -f resultados/.*.tmp
  exit 127
}

#compilar
for o in $o_list;
do
  mkdir -p "bin/O$o"
  # compilar
  gcc main.c -o "bin/O$o/main" "-O$o"
done

# ejecutar
mkdir -p resultados
echo " -> Ejecutando.."
T="$(date +%s)" # INICIO -- medir tiempo ejecucion
for o in $o_list; # optimizations
do
  echo -e "\n\t- Optimizacion O$o"
  for n in $n_list; # matrix size
  do
    echo -e "\t\t- N=$n.."
    ./bin/O$o/main $n > resultados/.$o$n.tmp & # sin el & podemos ejecutarlo en serie
    let NPROC=NPROC+1 # un proceso mas
    [[ $((NPROC%NR_CPUS)) -eq 0 ]] && wait # si hay mas procesos que CPUs, esperamos
  done
done

wait # esperar por todos los procesos

T="$(($(date +%s)-T))" # FINAL -- medir tiempo ejecucion
echo -e "\n -> Ejecutado en $T segundos"

# guardar
echo " -> Guardando datos..."
echo "N;O0 no optimizado;O0 optimizado;O1 no optimizado;O1 optimizado;O2 no optimizado; O2 optimizado;O3 no optimizado;O3 optimizado" > resultados/resultados.csv
for n in $n_list; # optimizations
do
  echo -n "N=$n" >> resultados/resultados.csv
  for o in $o_list; # matrix size
  do
    cat resultados/.$o$n.tmp >> resultados/resultados.csv
  done
  echo >> resultados/resultados.csv
done
rm -f resultados/.*.tmp
