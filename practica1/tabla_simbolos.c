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
	int maxsize = 32;
	lexema * l = (lexema*) malloc(sizeof(lexema));
	l->numero = 269; // ID
	l->linea = -1; // Palabra reservada
	l->string = (char*) malloc(maxsize*sizeof(char));

	l->string = "function";		insertarTabla(l);
	l->string = "if";			insertarTabla(l);
	l->string = "sign";			insertarTabla(l);
	l->string = "error";		insertarTabla(l);
	l->string = "end";			insertarTabla(l);
	l->string = "while";		insertarTabla(l);
	l->string = "eps";			insertarTabla(l);
	l->string = "return";		insertarTabla(l);
	l->string = "else";			insertarTabla(l);
	l->string = "try";			insertarTabla(l);
	l->string = "catch";		insertarTabla(l);
	l->string = "println";		insertarTabla(l);
	l->string = "Inf";			insertarTabla(l);
}

// Liberar memoria
void liberarTabla()
{
	suprimir(&raiz);
}

// insertarar lexema en la tabla
void insertarTabla(lexema * l)
{
	insertar(&raiz, l);
}

// buscar lexema en la tabla (1 si esta, 0 si no)
int busquedaTabla(lexema * l)
{
	return existe(&raiz, l);
}

// Imprime la tabla de simbolos
void imprimirTabla()
{
	imprimir(raiz);
}
