
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
#include "errores.h"
#include "definiciones.h"

int numlinea=1; // Contamos el numero de lineas (empiezan en 1)
char c;
int estado; // Para controlar los automatas
int end=0, fileEnd=0;
int finDeComentarioMultilinea = 0; // 1 si estamos esperando un #
int numChar = 0; // caracteres del lexema

// Inicio lexema
void inicioLexema()
{
	moverInicio(); // Actualizamos el puntero de inicio de lexema
	c = siguienteCaracter(); // Me traigo el siguiente caracter

	if (c == EOF) {
		fileEnd=1;
		end=1;
	}

	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case ' ': case '\t': break;
		case '\n': numlinea++; break;
		case '(': case ')': case ',': case '+': case '-': case '*': case '^': case ';': numChar++; end = 1; break;
		case '=': case '<': case '>': numChar++; estado = 6; break; // puede haber un = despues
		case '"': numChar++; estado = 7; break; // leo un string
		case '/': numChar++; estado = 8; break; // puedo leer otro '/'
		case '0': numChar++; estado = 9; break; // puede ser un hexadecimal 0x...

		default:
		if (isdigit(c)) {
			estado = 1; // Pasamos al estado de lectura de digitos
			break;	
		} 
		else if (isalpha(c)) {
			estado = 2; // Pasamos al estado de lectura alfanumerico
			break;
		}
		else if (c == '#') {
			estado = 3; // Estado de comentarios
			break;
		}
		break;
	}
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
		case '(': case ')': case ',': case '+': case '-': case '*': case '/': case '^': case ';': end = 1; retroceder(1); break;
		case '=': case '<': case '>': retroceder(1); end = 1; break;
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
		case '(': case ')': case ',': case '+': case '-': case '*': case '/': case '^': case ';': end = 1; retroceder(1); break;
		case '=': case '<': case '>': retroceder(1); end = 1; break;
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

// Al detectar un < o un > o un = esperamos un = (o no)
void comparador()
{
	c = siguienteCaracter();

	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case '\n': numlinea++; end = 1; break;
		case '=': numChar++; end = 1; break; // Segundo caracter del comparador
		default: retroceder(1); end = 1; // Si no es = retrocedemos y acabamos
	}
}

void strings()
{
	c = siguienteCaracter();

	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case '\n': numlinea++; end = 1; break;
		case '"': numChar++; end = 1; break; // Acaba el string
		default: numChar++; break; // Leo cualquier cosa dentro del string
	}
}

void fraccion()
{
	c = siguienteCaracter();

	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case '\n': numlinea++; end = 1; break;
		case '/': numChar++; end = 1; break; // Acaba el //
		default: retroceder(1); end = 1; break; // No hay un /
	}
}

void inicioHexadecimal()
{
	c = siguienteCaracter();

	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case ' ': case '\t': end = 1; break;
		case '\n': numlinea++; end = 1; break;
		case '(': case ')': case ',': case '+': case '-': case '*': case '/': case '^': case ';': end = 1; retroceder(1); break;
		case '=': case '<': case '>': retroceder(1); end = 1; break;
		case 'x': numChar++; estado = 10; break; // 0x
		default: // no es 0x

		if (isalpha(c)) {
			retroceder(1);
			end = 1;
		} else {
			//numChar++; // Sigo en los digitos
			estado = 1;
		}
		break;
	}
}

void hexadecimal()
{
	c = siguienteCaracter();

	switch(c) {
		case EOF: end = 1; fileEnd = 1; break;
		case '\n': numlinea++; end = 1; break;
		default:
		// Si es digito sigue, y si es letra comprobamos que sea valida 
		if (isalpha(c)) {
			c = tolower(c);

			if (c == 'a' || c == 'b' || c == 'c' || c == 'd' || c == 'e' || c == 'f') {
				numChar++;
			} else {
				// Aunque no sea hexadecimal puede ser un numero con una variable -> 0xz (0 * xz)
				retroceder(numChar);
				end = 1;
			}
		} else if (isdigit(c)){
			numChar++; // Sigo leyendo numeros
		}
		break;
	}
}

// Retorna el codigo del lexema (descrito en el fichero de definiciones.h)
int obtenerDefinicion(char* lexema)
{
	c = lexema[0];
	int i=0;

	// Si solo es un caracter retornamos el codigo ASCII
	if (strlen(lexema) == 1) {
		return c;
	}

	if ( isalpha(c) ) {
		if (!strcmp(lexema, "function")) {
			return FUNCTION;
		}
		if (!strcmp(lexema, "if")) {
			return IF;
		}
		if (!strcmp(lexema, "sign")) {
			return SIGN;
		}
		if (!strcmp(lexema, "error")) {
			return ERROR;
		}
		if (!strcmp(lexema, "end")) {
			return END;
		}
		if (!strcmp(lexema, "while")) {
			return WHILE;
		}
		if (!strcmp(lexema, "eps")) {
			return EPS;
		}
		if (!strcmp(lexema, "return")) {
			return RETURN;
		}
		if (!strcmp(lexema, "else")) {
			return ELSE;
		}
		if (!strcmp(lexema, "try")) {
			return TRY;
		}
		if (!strcmp(lexema, "catch")) {
			return CATCH;
		}
		if (!strcmp(lexema, "println")) {
			return PRINTLN;
		}
		if (!strcmp(lexema, "Inf")) {
			return INF;
		}
		// Si no es ninguna palabra reservada, es un ID
		return ID;
	}

	if ( isdigit(c) ) {
		// Si tiene un '.' es un float
		for (i = 0; i < strlen(lexema); i++) {
			if (lexema[i] == '.') {
				return FLOAT;
			}
		}
		// Si su segundo caracter es una 'x' es un Hexadecimal
		if (lexema[1] == 'x') {
			return HEX;
		}
		return INT;
	}

	switch(c) {
		// Asumimos que aqui tenemos mas de un caracter (sino ya hubiera retornado)
		case '"': return STRING; break;
		case '/': return FRACTION; break;
		case '>': return GREATEREQ; break;
		case '<': return LESSEQ; break;
		case '=': return EQUALS; break;
	}

	return -2;
}

token* siguienteComponenteLexico()
{
	token* comp_lex; // Puntero a la estructura que vamos a devolver

	comp_lex = (token*) malloc(sizeof(token));

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

			case 6: // Inicio de un comparador
			comparador();

			break;

			case 7:
			strings();

			break;

			case 8:
			fraccion();

			break;

			case 9:
			inicioHexadecimal();

			break;

			case 10:
			hexadecimal();

			break;

			default: // No reconocido
			end=1;
			break;
		}
	}

	if (!fileEnd) {
		comp_lex->lexema = (char*) malloc(numChar*sizeof(char)); // Reservo solo la memoria que necesito (numChar)
		comp_lex->lexema = lexemaActual(numChar);
		comp_lex->linea = numlinea;
		comp_lex->numero = obtenerDefinicion(comp_lex->lexema);
	} else {
		comp_lex->numero = EOF;
	}

	return comp_lex;
}
