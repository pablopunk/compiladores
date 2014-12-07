//
// Implementacion de la tabla de simbolos
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Librerias propias
#include "tabla_simbolos.h"

nodo * raiz;

// inicializar la tabla de simbolos
void inicializarTabla()
{
}

// Liberar memoria
void liberarTabla()
{
	suprimir(&raiz);
}

// insertarar lexema en la tabla
void insertarTabla(token * lexema)
{
	insertar(&raiz, lexema);
}

// buscar lexema en la tabla (1 si esta, 0 si no)
int busquedaTabla(token * lexema)
{
	return existe(&raiz, lexema);
}

// Imprime la tabla de simbolos
void imprimirTabla()
{
	imprimir(raiz);
}