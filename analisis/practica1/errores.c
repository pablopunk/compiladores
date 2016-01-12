
//
// Implementacion de la gestion de errores
//

#include <stdio.h>

// Imprimir error con un mensaje y la linea donde se produce
void errorLexico(char actual, char* msg, int linea, int codigo)
{
	printf("* Error #%i en la linea %i ['%c']: %s\n", codigo, linea, actual, msg);
}

// Imprimir un error al abrir el archivo
void errorArchivo(char* msg, int codigo)
{
	printf("Error #%i: %s\n", codigo, msg);
}
