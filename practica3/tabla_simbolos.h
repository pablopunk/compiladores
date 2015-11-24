//
// Interfaz de la tabla de simbolos
//

// Librerias propias
#include "abin.h"

// inicializar la tabla de simbolos y liberar
void inicializarTabla();
void liberarTabla();

// insertar en la tabla variables y funciones
void insertarVariable(char* nombre, double valor);
void insertarFuncion(char* nombre, double (*fun)());

// insertar nodo en la tabla
void insertarTabla(info * v);

// obtener valor de la variable
double obtenerValor(char* nombre);

// obtener una funcion
info * buscarFuncion(char* nombre);

// Imprime la tabla de simbolos
void imprimirTabla();
