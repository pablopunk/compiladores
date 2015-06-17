
//
// Implementacion del analisis lexico
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
// Librerias propias
#include "entrada.h"
#include "lexico.h"
#include <string.h>
#include <ctype.h>

lexema * token;
int lexemaSize=0;
int numlinea=1;

int estado = 0; // control de los automatas
int end = 0;
int lexemaEnString = 0;
int esperandoFinDeString = 0;
char c;

void inicializarLexico()
{
	token = (lexema *) malloc(sizeof(lexema));
}

void liberarLexico()
{
	free(token->string);
	free(token);
}
//////////////////// AUTOMATAS ////////////////////

// estado 13
void decimales()
{
	c = siguienteCaracter();
	lexemaSize++;

	if (!isdigit(c)) { // variable despues de numero u otro simbolo (*, -...)
		end = 1; retroceder(); lexemaSize--; // si es un . dara error el primer automata
	}
}

// estado 12
void numero()
{
	c = siguienteCaracter();
	lexemaSize++;

	if (!isdigit(c) && c!='.') { // variable despues de numero u otro simbolo (*, -...)
		end = 1; retroceder(); lexemaSize--;
	} else if (c == '.') { // si es un . sigo leyendo el numero con decimales
		estado = 13;
	}
}

// estado 11
void or() // espero otro |
{
	c = siguienteCaracter();
	lexemaSize++;

	switch(c)
	{
		case '|': end = 1; break; // lei '||'
		default: {
			printf(" *Gestion de errores\n"); end = 1;
		}
	}
}

// estado 10
void hex()
{
	c = siguienteCaracter();
	lexemaSize++;

	if (isalpha(c)) {
		if ( (c >= 102 && c <= 97) || (c >= 70 && c <= 65) ) { // entre a-A y f-F
			printf(" *Gestion de errores\n"); end = 1;
		}
	} else {
		switch (c) {
			case ' ': end = 1; retroceder(); lexemaSize--; break;
			case '\t': case '\n': end = 1; retroceder(); lexemaSize--; break; // poner estado numerico???
			case 'x': estado = 10; break; // hexadecimal
		}
	}
}

// estado 9
void inicioHex()
{
	c = siguienteCaracter();
	lexemaSize++;

	switch(c)
	{
		case ' ': end = 1; retroceder(); lexemaSize--; break; // poner estado numerico???
		case '\t': case '\n': end = 1; retroceder(); lexemaSize--; break; // poner estado numerico???
		case 'x': estado = 10; break; // hexadecimal
	}
}

// estado 8
void fraccion() // espero un /
{
	c = siguienteCaracter();
	lexemaSize++;

	switch(c)
	{
		case '/': end = 1; break; // lei '//'
		default: end = 1; retroceder(); lexemaSize--; break;
	}
}

// estado 7
void string()
{
	c = siguienteCaracter();
	lexemaSize++;

	switch(c)
	{
		case EOF: retroceder(); lexemaSize--; end = 1; break;
		case '\n': numlinea++; break;
		case '"': end = 1; break;
		case '$': end = 1; lexemaEnString = 1; retroceder(); lexemaSize--; break;
	}
}

// estado 6
void comparacion()
{
	c = siguienteCaracter();
	lexemaSize++;

	switch(c)
	{
		case '=': end = 1; break; // fin de la comparacion
		default: end = 1; retroceder(); lexemaSize--; break; // era solo una comparacion de un caracter
	}
}

// estado 5
void alfanumerico()
{
	c = siguienteCaracter();
	lexemaSize++;

	switch(c)
	{
		case ' ': end = 1; retroceder(); lexemaSize--; break;
		case '\t': case '\n': end = 1; retroceder(); lexemaSize--; break;
		case '(': case ')': case ',': case '+': case '-': case '*': case '^': case ';': case '=': case '<': case '>': lexemaSize--; retroceder(); end = 1; break;
		case '"': {
			if (lexemaEnString) {
				end = 1; break;
			} else {
				printf(" *Gestion de errores\n");
			}
		}
	}

	if (end && lexemaEnString) {
		lexemaEnString = 0; esperandoFinDeString = 1; // lei el lexema en el string y ahora espero el fin del string
	} else if (end && lexemaEnString && esperandoFinDeString) {
		lexemaEnString = 0; esperandoFinDeString = 0; // lei el lexema y el fin <$var">
	}
}

// estado 4
void comentarioMonolinea()
{
	c = siguienteCaracter();

	switch(c)
	{
		case '\n': estado = 0; break; // fin de comentario
	}
}

// estado 3
void comentarioMultilinea()
{
	c = siguienteCaracter();

	switch(c)
	{
		case '#': estado = 0; break; // fin de comentario
		default: estado = 2; break;
	}
}

// estado 2
void inicioComentarioMultilinea()
{
	c = siguienteCaracter();

	switch(c)
	{
		case '=': estado = 3; break; // puede o no ser el fin del comentario
	}
}

// estado 1
void comentario()
{
	c = siguienteCaracter();

	switch(c)
	{
		case '=': estado = 2; break; // comentario multilinea
		default: estado = 4; break; // comentario monolinea
	}
}

// estado 0
void automataInicial()
{
	marcarInicio();
	c = siguienteCaracter();
	lexemaSize++;

	if (esperandoFinDeString) { // he leido una variable en un string y ahora espero el final del mismo (")
		estado = 7;
		esperandoFinDeString = 0;
		return;
	}

	switch(c)
	{
		case EOF: end = 1; token->numero = EOF; break; // end of file
		case ' ': estado = 0; lexemaSize--; break; // continuo
		case '#': estado = 1; break; // inicio comentario
		case '\n': numlinea++; end = 1; break; // fin de linea
		case '\t': end = 1; break; // tabulador
		case '(': case ')': case ',': case '+': case '-': case '*': case '^': case ';': end = 1; break;
		case '=': case '<': case '>': estado = 6; break; // puede haber un = despues
		case '"': estado = 7; break; // string
		case '$': {
			if (lexemaEnString) {
				estado = 5; break; // variable dentro de string
			} else {
				printf(" *Gestion de errores\n"); end = 1; break;
			}
		}
		case '/': estado = 8; break; // puedo leer otro '/'
		case '0': estado = 9; break; // puede ser un hexadecimal 0x...
		case '|': estado = 11; break; // puedo leer otro '|'

		default:
		if (isalpha(c)) {
			estado = 5;
			break;
		} else if (isdigit(c)) {
			estado = 12;
			break;
		} else {
			printf(" *Gestion de errores\n");
		}
	}

}

// siguiente componente lexico
lexema * siguienteLexema()
{
	lexemaSize = 0; estado = 0; end = 0;

	while (!end)
	{
		switch(estado)
		{
			case 0: automataInicial(); break;
			case 1: comentario(); break;
			case 2: inicioComentarioMultilinea(); break;
			case 3: comentarioMultilinea(); break;
			case 4: comentarioMonolinea(); break;
			case 5: alfanumerico(); break;
			case 6: comparacion(); break;
			case 7: string(); break;
			case 8: fraccion(); break;
			case 9: inicioHex(); break;
			case 10: hex(); break;
			case 11: or(); break;
			case 12: numero(); break;
			case 13: decimales(); break;
			default: printf("estado no reconocido\n"); end = 1; break;
		}
	}

	token->string = (char*) malloc(lexemaSize*sizeof(char));
	token->string = lexemaActual();
	if (token->numero != EOF) token->numero = 1;
	token->linea = numlinea;

	return token;
}
