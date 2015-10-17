
//
// Implementacion de la gestion de errores
//

#include <stdio.h>

// Imprimir error con un mensaje y la linea donde se produce
void error(char actual, char* msg, int linea, int codigo)
{
	printf("* Error #%i en la linea %i ['%c']: %s\n", codigo, linea, actual, msg);
}
