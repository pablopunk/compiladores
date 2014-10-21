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

	do {
		componente = siguienteComponenteLexico();
		if (componente->numero == EOF) { // Si alcanzamos EOF
			break; // Salimos del bucle
		}
		printf("%s", componente->lexema);

	} while (1);

	return 0;
}