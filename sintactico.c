//
// Fichero de implementacion del analizador sintactico
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Librerias propias
#include "lexico.h"
#include "entrada.h"

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

	token* componente;

	while ( (componente = siguienteComponenteLexico()) && (componente->numero != EOF) ) {
		printf("%i| <%i>\t%s\n", componente->linea, componente->numero, componente->lexema);
	}

	return 0;
}
