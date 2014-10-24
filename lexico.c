
//
// Implementacion del analizador lexico
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
// Librerias propias
#include "entrada.h"
#include "lexico.h"

int numlinea=0;
char c;
int estado; // Para controlar los automatas
int end=0, fileEnd=0;
int finDeComentarioMultilinea = 0; // 1 si estamos esperando un #
int numChar = 0; // caracteres del lexema

// Inicio lexema
void inicioLexema()
{
	c = siguienteCaracter(); // Me traigo el siguiente caracter
	moverInicio(); // Actualizamos el puntero de inicio de lexema

	if (c == EOF) {
		fileEnd=1;
		end=1;
	}

	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case ' ': case '\t': break;
		case '\n': numlinea++; break;
		case '(': case ')': case ',': case '=': end = 1; break;
	}

	if (isdigit(c)) estado = 1; // Pasamos al estado de lectura de digitos
	else if (isalpha(c)) estado = 2; // Pasamos al estado de lectura alfanumerico
	else if (c == '#') estado = 3; // Estado de comentarios
}

// Lexema numerico
void lexemaNumerico()
{
	c = siguienteCaracter(); // Me traigo el siguiente caracter
	numChar++;

	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case ' ': case '\t': end = 1; break;
		case '\n': numlinea++; end = 1; break;
		case '(': case ')': case ',': case '=': end = 1; retroceder(); break;
	}
}
// Lexema alfanumerico
void lexemaAlfanumerico()
{
	c = siguienteCaracter(); // Me traigo el siguiente caracter
	numChar++;
	
	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case ' ': case '\t': end = 1; break;
		case '\n': numlinea++; end = 1; break;
		case '(': case ')': case ',': case '=': end = 1; retroceder(); break;
	}
}

// Al detectar un comentario
void inicioComentario()
{
	c = siguienteCaracter(); // Me traigo el siguiente caracter

	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case '\n': numlinea++; estado = 0; break; // Ignoramos el comentario
		case '=': estado = 4; break; // Comentario multilinea
		default: estado = 5; break; // Comentario monolinea
	}
}

// Al detectar un comentario multilinea
void comentarioMultilinea()
{
	c = siguienteCaracter(); // Me traigo el siguiente caracter
	if (c == '=' && !finDeComentarioMultilinea) finDeComentarioMultilinea = 1;
	else if (c == '#' && finDeComentarioMultilinea) {
		finDeComentarioMultilinea = 0;
		estado = 0; // Siguiente lexema (ignoramos el comentario)
	}
	else if (c == '\n') numlinea++;
}

// Al detectar un comentario monolinea
void comentarioMonolinea()
{
	c = siguienteCaracter();
	if (c == '\n') {
		numlinea++;
		estado = 0; // Siguiente lexema (ignoramos el comentario)
	}
}

token* siguienteComponenteLexico()
{
	token* comp_lex; // Puntero a la estructura que vamos a devolver

	comp_lex = (token*) malloc(sizeof(token));
	comp_lex->lexema = (char*) malloc(32*sizeof(char));

	comp_lex->lexema = "";
	//comp_lex->numero = EOF;

	estado = 0;  end=0, fileEnd=0; finDeComentarioMultilinea = 0; numChar = 0;

	while (!end) {
		switch (estado) {
			case 0: // Aun no comenzamos leyendo un lexema
			inicioLexema();

			break;

			case 1: // Estamos leyendo un lexema numerico
			lexemaNumerico();

			break;

			case 2: // Estamos leyendo un lexema alfanumerico
			lexemaAlfanumerico();

			break;

			case 3: // Estamos leyendo un comentario
			inicioComentario();

			break;

			case 4: // Comentario multilinea
			comentarioMultilinea();

			break;

			case 5: // Comentario monolinea
			comentarioMonolinea();

			break;

			default: // No reconocido
			end=1;
			break;
		}
	}

	if (!fileEnd) {
		comp_lex->lexema = lexemaActual(numChar);
		// Identificar componente lexico
	} else {
		comp_lex->numero = EOF;
	}

	return comp_lex;
}
