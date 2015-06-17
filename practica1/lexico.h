
//
// Interfaz del analisis lexico
//

typedef struct {
	char* string;
	int numero;
	int linea;
} lexema;

// Reservamos memoria
void inicializarLexico();
// liberamos memoria
void liberarLexico();
// siguiente componente lexico
lexema * siguienteLexema();