// TAD arbol

struct info
{
	char* lexema;/* identificador */
	int valor;	 /* valor de la variable */
	int numero;  /* identificador */ 
	int linea;   /* linea de codigo */
};

typedef struct info token;

struct celda {
   token* val; /* la informacion de cada nodo */
   struct celda * right, * left;
};

typedef struct celda nodo;

void insertar(nodo ** tree, token * item);
int existe(nodo ** tree, token * item);
void imprimir(nodo * tree);
void suprimir(nodo ** tree);