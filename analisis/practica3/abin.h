// TAD arbol

// una variable es formada por un nombre (x) y un valor (x=1.0)
struct estructura {
  char* nombre;
  double valor;
	double (*funcion)(double); // puntero a una funcion
	char tipo; // v (variable) - f (funcion)
};

typedef struct estructura info;

struct celda {
   info * val;
   struct celda * right, * left;
};

typedef struct celda nodo;

void insertar(nodo ** tree, info * item);
double buscar(nodo ** tree, char * item);
info * buscarF(nodo ** tree, char * item);
void imprimir(nodo * tree);
void suprimir(nodo ** tree);
