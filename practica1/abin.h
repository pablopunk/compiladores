// TAD arbol

#include "lexico.h" // estructura lexema

struct celda {
   lexema * val;
   struct celda * right, * left;
};

typedef struct celda nodo;

int insertar(nodo ** tree, lexema * item);
int existe(nodo ** tree, lexema * item);
void imprimir(nodo * tree);
void suprimir(nodo ** tree);
