
//
// Interfaz del analisis lexico
//
#ifndef LEXICO_H
#define LEXICO_H

typedef struct {
	char* string;
	int numero;
	int linea;
} lexema;

#endif

// Reservamos memoria
void inicializarLexico(char* archivo);
// Liberamos memoria
void liberarLexico();
// siguiente componente lexico
lexema * siguienteLexema();
