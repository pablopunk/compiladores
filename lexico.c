
//
// Implementacion del analizador lexico
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Librerias propias
#include "entrada.h"
#include "lexico.h"

// Macros
#define FILEMODE "r" // Modo de apertura del archivo
#define N 4096 // Tamano del buffer

int main(int argc, char** argv)
{
	int out=0;
	if (argc < 2) { // no hay argumentos de entrada
		printf("Sin argumentos...\n");
		return -1;
	}

	strcpy(nombreArchivo, argv[1]);
	if ( (out = leerArchivo()) ) {
		return out; // devuelvo el error que me devuelve la funcion
	}

	char c;

	while ( (c = siguienteCaracter()) != -1) {
		printf("%c", c);
	}

	return 0;
}
