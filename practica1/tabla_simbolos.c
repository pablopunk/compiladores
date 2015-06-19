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
#include "definiciones.h"

nodo * raiz;

// inicializar la tabla de simbolos
void inicializarTabla()
{
	// Palabras reservadas
	int maxsize = 32;
	lexema * l = (lexema*) malloc(sizeof(lexema));
	l->linea = -1; // Palabra reservada
	l->string = (char*) malloc(maxsize*sizeof(char));

	l->string = "function"; l->numero = FUNCTION;	insertarTabla(l);
	l->string = "if";		l->numero = IF;			insertarTabla(l);
	l->string = "sign";		l->numero = SIGN;		insertarTabla(l);
	l->string = "error";	l->numero = ERROR;		insertarTabla(l);
	l->string = "end";		l->numero = END;		insertarTabla(l);
	l->string = "while";	l->numero = WHILE;		insertarTabla(l);
	l->string = "eps";		l->numero = EPS;		insertarTabla(l);
	l->string = "return";	l->numero = RETURN;		insertarTabla(l);
	l->string = "else";		l->numero = ELSE;		insertarTabla(l);
	l->string = "try";		l->numero = TRY;		insertarTabla(l);
	l->string = "catch";	l->numero = CATCH;		insertarTabla(l);
	l->string = "println";	l->numero = PRINTLN;	insertarTabla(l);
	l->string = "Inf";		l->numero = INF;		insertarTabla(l);
	// podriamos seguir anhadiendo palabras reservadas
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
