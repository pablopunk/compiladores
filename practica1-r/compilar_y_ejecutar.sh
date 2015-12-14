
# archivo CSV
echo "Opciones;O0;O1;O2;O3;Os" > resultados/2h.csv

## compilacion

# -O0
gcc -O0 -S main.c -o O0/main.asm
gcc -O0 -c main.c -o O0/main.o
gcc -O0 -static main.c -o O0/main_static
gcc -O0 main.c -o O0/bin
# -O1
gcc -O1 -S main.c -o O1/main.asm
gcc -O1 -c main.c -o O1/main.o
gcc -O1 -static main.c -o O1/main_static
gcc -O1 main.c -o O1/bin
# -O2
gcc -O2 -S main.c -o O2/main.asm
gcc -O2 -c main.c -o O2/main.o
gcc -O2 -static main.c -o O2/main_static
gcc -O2 main.c -o O2/bin
# -O3
gcc -O3 -S main.c -o O3/main.asm
gcc -O3 -c main.c -o O3/main.o
gcc -O3 -static main.c -o O3/main_static
gcc -O3 main.c -o O3/bin
# -Os
gcc -Os -S main.c -o OS/main.asm
gcc -Os -c main.c -o OS/main.o
gcc -Os -static main.c -o OS/main_static
gcc -Os main.c -o OS/bin

## resultados
# Ejecucion
echo "Tiempo ejecución;\c" >> resultados/2h.csv
./O0/bin >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
./O1/bin >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
./O2/bin >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
./O3/bin >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
./OS/bin >> resultados/2h.csv
# Tamaño codigo objeto
echo "\nTamaño c. objeto;\c" >> resultados/2h.csv
ls -l O0/main.o | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
ls -l O1/main.o | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
ls -l O2/main.o | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
ls -l O3/main.o | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
ls -l OS/main.o | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
# Tamaño codigo objeto
echo "\nTamaño static bin;\c" >> resultados/2h.csv
ls -l O0/main_static | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
ls -l O1/main_static | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
ls -l O2/main_static | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
ls -l O3/main_static | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
echo ";\c" >> resultados/2h.csv
ls -l OS/main_static | cut -d' ' -f5 | xargs echo -n >> resultados/2h.csv
