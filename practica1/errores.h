
//
// Interfaz de la gestion de errores
//

#include <stdio.h>

#define CHAR_UNKNOWN 128
#define CHAR_UNEXPECTED 129
#define HEX_ERROR 130
#define LEX_UNKNOWN 131

// Imprimir error con un mensaje y la linea donde se produce
void error(char actual, char* msg, int linea, int codigo);
