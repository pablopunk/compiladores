//
// Interfaz de la tabla de simbolos
//

#include "abin.h"

// inicializar la tabla de simbolos y liberar
void inicializarTabla();
void liberarTabla();

// insertarar lexema en la tabla
void insertarTabla(token * lexema);

// buscar lexema en la tabla (1 si esta, 0 si no)
int busquedaTabla(token * lexema);

// Imprime la tabla de simbolos
void imprimirTabla();

// Devuelve el valor de la variable
double obtenerValor(char* variable);