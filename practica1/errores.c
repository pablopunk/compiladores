
//
// Implementacion de la gestion de errores
//

#include <stdio.h>

// Imprimir error con un mensaje y la linea donde se produce
void errorLexico(char actual, char* msg, int linea)
{
	printf("* Error en la linea %i ['%c']: %s\n", linea, actual, msg);
}