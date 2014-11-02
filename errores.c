//
// Fichero de implementacion de los errores
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>

// Imprimo un mensaje de error y el numero de linea
void error(int linea, char* message)
{
	printf(" --> Error en la linea %i: %s\n", linea, message);
}