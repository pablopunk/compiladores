
#include <stdio.h>

// Error en la tabla de simbolos
void errorTS(char* msg, int code)
{
  printf("** Error #%i en la tabla: %s\n", code, msg);
}

// Error en el analisis lexico
void errorLex(char* msg, int code)
{
  printf("** Error #%i en el lexico: %s\n", code, msg);
}
