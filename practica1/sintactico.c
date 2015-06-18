
//
// Implementacion del analisis lexico
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Librerias propias
#include "entrada.h"
#include "lexico.h"

int main(int argc, char** argv) 
{
	int i = 0;
	
	if (argc != 2) {
		printf("Uso: ./compilador fichero.jl\n");
		exit(0);
	}

	leerArchivo(argv[1]); // sistema de entrada

	// analisis lexico
	inicializarLexico();
	lexema * l = (lexema*) malloc(sizeof(lexema));

	printf("linea\t[id]\tlexema\n");
	while ( (l = siguienteLexema()) && (l->numero != EOF) ) { // mientras no sea EOF
		if (l->string[0] != '\n') printf(" %i\t[%i]\t%s \n", l->linea, l->numero, l->string);
		else printf(" %i\t[%i]\t\\n \n", l->linea-1, l->numero);
	}
}
