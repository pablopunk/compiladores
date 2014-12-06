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
	// Palabras reservadas
	int max_len_lexema = 16;
	token* T = (token*) malloc(sizeof(token));
	T->lexema = (char*) malloc(max_len_lexema*sizeof(char));
	T->lexema = "function";
	insertarTabla(T);
	T->lexema = "if";
	insertarTabla(T);
	T->lexema = "sign";
	insertarTabla(T);
	T->lexema = "error";
	insertarTabla(T);
	T->lexema = "end";
	insertarTabla(T);
	T->lexema = "while";
	insertarTabla(T);
	T->lexema = "eps";
	insertarTabla(T);
	T->lexema = "return";
	insertarTabla(T);
	T->lexema = "else";
	insertarTabla(T);
	T->lexema = "try";
	insertarTabla(T);
	T->lexema = "catch";
	insertarTabla(T);
	T->lexema = "println";
	insertarTabla(T);
	T->lexema = "Inf";
	insertarTabla(T);
	T->lexema = "int";
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
	imprimir(raiz);
}