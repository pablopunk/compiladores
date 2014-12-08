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
	token* T = (token*) malloc(sizeof(token));
	T->lexema = (char*) malloc(2*sizeof(char));
	strcpy(T->lexema, "pi");
	T->valor = 3.1415927;
	insertarTabla(T);
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
	if (raiz == NULL) {
		printf("La tabla esta vacia\n");
		return;
	}
	imprimir(raiz);
}

// Devuelve el valor de la variable
double obtenerValor(char* variable)
{
	return devolver(&raiz, variable);
}