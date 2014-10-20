
// 
// Interfaz del analizador lexico
// 

// Estructura para devolver los componentes lexicos

typedef struct
{
	char* lexema;
	int numero;
} token;

// Devuelve el puntero a la estructura de componente lexico (token)
token* siguienteComponenteLexico();