//
// Interfaz de la tabla de simbolos
//

// inicializar la tabla de simbolos y liberar
void inicializarTabla();
void liberarTabla();

// insertarar lexema en la tabla
void insertarTabla(char* lexema);

// buscar lexema en la tabla (1 si esta, 0 si no)
int busquedaTabla(char* lexema);

// Imprime la tabla de simbolos
void imprimirTabla();