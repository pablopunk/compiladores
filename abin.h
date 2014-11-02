// TAD arbol

struct celda {
   char* val;
   struct celda * right, * left;
};

typedef struct celda nodo;

void insertar(nodo ** tree, char* item);
int existe(nodo ** tree, char* item);
void imprimir(nodo * tree);
void suprimir(nodo ** tree);