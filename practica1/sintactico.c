
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
#include "tabla_simbolos.h"
#include "definiciones.h"

// Analisis sintactico
void analisisSintactico()
{
	lexema * l = (lexema*) malloc(sizeof(lexema));

	printf("-----\t----\t------\n");
	printf("linea\t[id]\tlexema\n");
	printf("-----\t----\t------\n");
	while ( (l = siguienteLexema()) && (l->numero != EOF) ) { // mientras no sea EOF
		if (l->string[0] != '\n' && l->string[0] != '\t') printf(" %i\t[%i]\t%s \n", l->linea, l->numero, l->string);
		else if (l->string[0] == '\t') printf(" %i\t[%i]\t\\t \n", l->linea, l->numero); // \n
		else printf(" %i\t[%i]\t\\n \n", l->linea-1, l->numero); // \t
	}

	// Imprimir tabla
	puts("");
	printf("------- Tabla de simbolos ------\n");
	printf("Identificador | Última aparición\n");
	printf("--------------------------------\n");
	imprimirTabla();
}

int main(int argc, char** argv)
{
	++argv, --argc;  /* se salta el nombre del programa */
	if (argc != 1) {
		printf("Uso: ./compilador fichero.jl\n");
		exit(0);
	}

	inicializarEntrada(argv[0]);
	inicializarLexico();
	inicializarTabla();
	analisisSintactico(); // analisis sintactico y lexico

	liberarTabla();
	liberarLexico();

  return 0;
}
