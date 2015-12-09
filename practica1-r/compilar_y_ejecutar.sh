
# archivo CSV
echo "Opciones;O0;O1;O2;O3;Os" > resultados/2h.csv

# -O0
gcc -O0 main.c -o .mainO0
echo "Tiempo;\c" >> resultados/2h.csv
./.mainO0 >> resultados/2h.csv

# -O1
gcc -O1 main.c -o .mainO1
echo ";\c" >> resultados/2h.csv
./.mainO1 >> resultados/2h.csv

# -O2
gcc -O2 main.c -o .mainO2
echo ";\c" >> resultados/2h.csv
./.mainO2 >> resultados/2h.csv

# -O3
gcc -O3 main.c -o .mainO3
echo ";\c" >> resultados/2h.csv
./.mainO3 >> resultados/2h.csv

# -Os
gcc -Os main.c -o .mainOs
echo ";\c" >> resultados/2h.csv
./.mainOs >> resultados/2h.csv
