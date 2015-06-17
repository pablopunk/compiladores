
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

	while ( (l = siguienteLexema()) && (l->numero != EOF) ) { // mientras no sea EOF
		if (l->string[0] != '\n') printf("%i | %s [%i]\n", l->linea, l->string, l->numero);
		else printf("%i | \\n [%i]\n", l->linea, l->numero);
		//printf("%s", l->string);
	}
}
