
//
// Interfaz de la gestion de errores
//

#include <stdio.h>

#define FILE_OPEN 127
#define CHAR_UNKNOWN 128
#define CHAR_UNEXPECTED 129
#define HEX_ERROR 130
#define LEX_UNKNOWN 131

// Imprimir error con un mensaje y la linea donde se produce
void errorLexico(char actual, char* msg, int linea, int codigo);

// Imprimir un error al abrir el archivo
void errorArchivo(char* msg, int codigo);
