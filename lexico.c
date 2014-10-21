
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

token* siguienteComponenteLexico()
{
	token* comp_lex; // Puntero a la estructura que vamos a devolver
	char c;

	comp_lex = (token*) malloc(sizeof(token));
	comp_lex->lexema = (char*) malloc(32*sizeof(char));

	c = siguienteCaracter();
	comp_lex->lexema[0] = c;

	if (c == -1) {
		comp_lex->numero = EOF;
	}

	return comp_lex;
}
