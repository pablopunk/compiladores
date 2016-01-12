//
// Implementacion de la tabla de simbolos
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
// Librerias propias
#include "tabla_simbolos.h"

nodo * raiz;

void insertarVariable(char* nombre, double valor)
{
	info * v = (info*) malloc(sizeof(info));
	v->nombre = (char*) malloc(strlen(nombre)*sizeof(char));
	strcpy(v->nombre, nombre); v->valor = valor; v->tipo='v'; insertarTabla(v);
}

void insertarFuncion(char* nombre, double (*fun)())
{
	info * v = (info*) malloc(sizeof(info));
	v->nombre = (char*) malloc(strlen(nombre)*sizeof(char));
	strcpy(v->nombre, nombre); v->funcion = fun; v->tipo='f'; insertarTabla(v);
}

// inicializar la tabla de simbolos
void inicializarTabla()
{
	// Palabras reservadas
	insertarVariable("pi", M_PI);
	insertarFuncion ("sin", sin);
	insertarFuncion ("cos", cos);
	insertarFuncion ("tan", tan);
	insertarFuncion ("acos", acos);
	insertarFuncion ("asin", asin);
	insertarFuncion ("atan", atan);
	insertarFuncion ("exp", exp);
	insertarFuncion ("log", log);
	insertarFuncion ("log10", log10);
}

// Liberar memoria
void liberarTabla()
{
	suprimir(&raiz);
}

// insertar variable en la tabla
void insertarTabla(info * l)
{
	return insertar(&raiz, l);
}

// obtener valor de la variable
double obtenerValor(char* nombre)
{
	return buscar(&raiz, nombre);
}

info * buscarFuncion(char* nombre) {
	return buscarF(&raiz, nombre);
}

// Imprime la tabla de simbolos
void imprimirTabla()
{
	imprimir(raiz);
}
