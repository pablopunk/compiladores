//
// Implementacion de la tabla de simbolos
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Librerias propias
#include "tabla_simbolos.h"
#include "abin.h"

nodo * raiz;

// inicializar la tabla de simbolos
void inicializarTabla()
{
	// Palabras reservadas
	insertarTabla("function");
	insertarTabla("if");
	insertarTabla("sign");
	insertarTabla("error");
	insertarTabla("end");
	insertarTabla("while");
	insertarTabla("eps");
	insertarTabla("return");
	insertarTabla("else");
	insertarTabla("try");
	insertarTabla("catch");
	insertarTabla("println");
	insertarTabla("Inf");
	insertarTabla("int");
}

// Liberar memoria
void liberarTabla()
{
	suprimir(&raiz);
}

// insertarar lexema en la tabla
void insertarTabla(char* lexema)
{
	insertar(&raiz, lexema);
}

// buscar lexema en la tabla (1 si esta, 0 si no)
int busquedaTabla(char* lexema)
{
	return existe(&raiz, lexema);
}

// Imprime la tabla de simbolos
void imprimirTabla()
{
	imprimir(raiz);
}