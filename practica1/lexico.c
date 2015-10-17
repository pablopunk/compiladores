
//
// Implementacion del analisis lexico
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
// Librerias propias
#include "entrada.h"
#include "lexico.h"
#include "definiciones.h"
#include "errores.h"
#include "tabla_simbolos.h"

lexema * token;
int lexemaSize=0; // contador del tamanho actual del lexema
size_t lexemaMax=8; // tamanho de la reserva de memoria para el lexema (aumentado x2 cuando hace falta)
int numlinea=1; // contador de la linea actual

int estado = 0; // control de los automatas
int end = 0; // estado final cuando end=1
int lexemaEnString = 0; // flag para saber si estamos analizando una variable alfanumerica dentro de un string ( "$var" )
int esperandoFinDeString = 0; // flag para saber cuando he leido una variable en un string (sigo leyendo para acabar el string)
int finDeFichero = 0; // cuando EOF

char c; // caracter actual

void inicializarLexico()
{
	token = (lexema *) malloc(sizeof(lexema));
}

// Liberamos memoria
void liberarLexico()
{
	token->string = NULL; free(token->string);
	token = NULL; free(token);
}

// guarda el siguiente caracter en el lexema
void siguienteCaracter() {
	c = siguienteEntrada();
	lexemaSize++;
	if (lexemaSize == lexemaMax) { // vuelvo a reservar memoria para seguir almacenando
		lexemaMax *= 2;
		token->string = (char*) realloc(token->string, lexemaMax);
	}
	token->string[lexemaSize-1] = c; // guardo el caracter
}

// descargar el actual caracter (no queremos guardarlo)
void descartarCaracter() {
	if (lexemaSize > 0) lexemaSize--;
	token->string[lexemaSize] = 0; // borrarlo
}

//////////////////// AUTOMATAS ////////////////////

// estado 13
void decimales()
{
	siguienteCaracter();

	if (!isdigit(c)) { // variable despues de numero u otro simbolo (*, -...)
		end = 1; retroceder(); descartarCaracter(); // si es un . dara error el primer automata
	}
}

// estado 12
void numero()
{
	siguienteCaracter();

	if (!isdigit(c) && c!='.') { // variable despues de numero u otro simbolo (*, -...)
		end = 1; retroceder(); descartarCaracter();
	} else if (c == '.') { // si es un . sigo leyendo el numero con decimales
		estado = 13;
	}
}

// estado 11
void or() // espero otro |
{
	siguienteCaracter();

	switch(c)
	{
		case '|': end = 1; break; // lei '||'
		default: {
			error(c, "Se esperaba otro '|'", numlinea, CHAR_UNEXPECTED); end = 1;
		}
	}
}

// estado 10
void hex()
{
	siguienteCaracter();

	if (isalpha(c)) {
		char h = tolower(c);
		if ( h < 97 || h > 102) { // entre a-A y f-F
			error(c, "Hexadecimal incorrecto", numlinea, HEX_ERROR); end = 1;
		}
	} else {
		switch (c) {
			case ' ': end = 1; retroceder(); descartarCaracter(); break;
			case '\t': case '\n': end = 1; retroceder(); descartarCaracter(); break; // poner estado numerico???
		}
	}
}

// estado 9
void inicioHex()
{
	siguienteCaracter();

	switch(c)
	{
		case ' ': end = 1; retroceder(); descartarCaracter(); break; // poner estado numerico???
		case '\t': case '\n': end = 1; retroceder(); descartarCaracter(); break; // poner estado numerico???
		case 'x': estado = 10; break; // hexadecimal
		case '.': estado = 13; break; // 0.
	}

	if (isdigit(c)) estado = 12;
}

// estado 8
void fraccion() // espero un /
{
	siguienteCaracter();

	switch(c)
	{
		case '/': end = 1; break; // lei '//'
		default: end = 1; retroceder(); descartarCaracter(); break;
	}
}

// estado 7
void string()
{
	siguienteCaracter();

	switch(c)
	{
		case EOF: finDeFichero = 1; end = 1; break;
		case '\n': break;
		case '"': end = 1; break;
		case '$': end = 1; lexemaEnString = 1; retroceder(); descartarCaracter(); break;
	}
}

// estado 6
void comparacion()
{
	siguienteCaracter();

	switch(c)
	{
		case '=': end = 1; break; // fin de la comparacion
		default: end = 1; retroceder(); descartarCaracter(); break; // era solo una comparacion de un caracter
	}
}

// estado 5
void alfanumerico()
{
	siguienteCaracter();

	switch(c)
	{
		case ' ': end = 1; retroceder(); descartarCaracter(); break;
		case '\t': case '\n': end = 1; retroceder(); descartarCaracter(); break;
		case '(': case ')': case ',': case '+': case '-': case '*': case '^': case ';': case '=': case '<': case '>': descartarCaracter(); retroceder(); end = 1; break;
		case '"': {
			if (lexemaEnString) {
				end = 1; lexemaEnString=0; break;
			} else {
				error(c, "Caracter inesperado", numlinea, CHAR_UNEXPECTED);
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
	c = siguienteEntrada(); // no forma parte de un lexema

	switch(c)
	{
		case '\n': estado = 0; retroceder(); break; // fin de comentario
	}
}

// estado 3
void comentarioMultilinea()
{
	c = siguienteEntrada(); // no forma parte de un lexema

	switch(c)
	{
		case '#': estado = 0; break; // fin de comentario
		default: estado = 2; break;
	}
}

// estado 2
void inicioComentarioMultilinea()
{
	c = siguienteEntrada(); // no forma parte de un lexema

	switch(c)
	{
    case '\n': numlinea++; break;
		case '=': estado = 3; break; // puede o no ser el fin del comentario
	}
}

// estado 1
void comentario()
{
	c = siguienteEntrada(); // no forma parte de un lexema

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
	siguienteCaracter();

	if (esperandoFinDeString) { // he leido una variable en un string y ahora espero el final del mismo (")
		estado = 7;
		esperandoFinDeString = 0;
		return;
	}

	switch(c)
	{
		case EOF: finDeFichero = 1; end = 1; break; // end of file
		case ' ': estado = 0; descartarCaracter(); break; // continuo
		case '#': estado = 1; descartarCaracter(); break; // inicio comentario
		case '\n': numlinea++; end = 1; break; // fin de linea
		case '\t': end = 1; break; // tabulador
		case '(': case ')': case ',': case '+': case '-': case '*': case '^': case ';': end = 1; break;
		case '=': case '<': case '>': estado = 6; break; // puede haber un = despues
		case '"': estado = 7; break; // string
		case '$': {
			if (lexemaEnString) {
				estado = 5; break; // variable dentro de string
			} else {
				error(c, "Caracter inesperado", numlinea, CHAR_UNEXPECTED); end = 1; break;
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
			error(c, "Caracter no reconocido", numlinea, CHAR_UNKNOWN);
		}
	}

}

int identificarLexema()
{
	if (finDeFichero) {
		token->numero = EOF;
		return EOF;
	}

	if (strlen(token->string) == 1 && estado == 7) { // comilla inicial de un string con una variable despues
   	  	if (token->string[0]=='"') {
        	token = siguienteLexema();
      		return token->numero;
    	}
  	}

	if (strlen(token->string) == 1 && estado != 5 && estado != 12) { // tamanho 1 y no es un id ni un int
		return (int) token->string[0]; // codigo ascii
	}

	switch (estado){
			case 5: case 6: case 8: case 11: {

			if (!strcmp(token->string, "//")) {
				return FRACTION;
			} else if (!strcmp(token->string, ">=")) {
				return GREATEREQ;
			} else if (!strcmp(token->string, "<=")) {
				return LESSEQ;
			} else if (!strcmp(token->string, "==")) {
				return EQUALS;
			} else if (!strcmp(token->string, "||")) {
				return OR;
			} else {
				if (token->string[0] == '$') { // variable en string
					token->string++; // borrar el $
				}
				if (token->string[strlen(token->string)-1] == '"') { // variable al finalizar string
					token->string[strlen(token->string)-1] = 0; // borrar el " poniendo un '\0'
				}
				return insertarTabla(token); // comprueba si es un ID (y lo mete en la tabla si no existe) o una palabra reservada
			}

			break;
		}
		case 7:
			if (token->string[0] == '"') { // comilla inicial
				token->string++; // borrar
			}

			if (token->string[strlen(token->string)-1]=='"') { // comilla final
				token->string[strlen(token->string)-1] = 0; // borrar
			}

			return STRING; break;
		case 10: return HEX; break;
		case 12: return INT; break;
		case 13: return FLOAT; break;
		default:
			error(c, "No se reconoce el lexema", numlinea, LEX_UNKNOWN);
			return ID;
	}

	return ID;
}

// siguiente componente lexico
lexema * siguienteLexema()
{
	token->string = (char*) malloc(lexemaMax);
	lexemaSize = 0; estado = 0; end = 0;

	while (!end)
	{
		//printf ("-> estado: %i\n", estado);
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

	token->numero = identificarLexema();
	token->linea = numlinea;

	return token;
}
