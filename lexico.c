
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

int automata

token* siguienteComponenteLexico()
{
	token* comp_lex; // Puntero a la estructura que vamos a devolver
	char c;

	comp_lex = (token*) malloc(sizeof(token));
	comp_lex->lexema = (char*) malloc(32*sizeof(char));

	c = siguienteCaracter();

	return comp_lex;
}
