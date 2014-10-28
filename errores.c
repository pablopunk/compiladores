//
// Fichero de implementacion de los errores
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>

void error(int linea, char* message)
{
	printf(" --> Error en la linea %i: %s\n", linea, message);
}