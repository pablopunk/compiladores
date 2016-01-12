
#define TS_NOT_FOUND 128
#define LEX_UNKNOWN 129

// Error en la tabla de simbolos
void errorTS(char* msg, int code);

// Error en el analisis lexico
void errorLex(char* msg, int code);
