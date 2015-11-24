
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "abin.h"
#include "errores.h"

void insertar(nodo ** tree, info * item) {
	if(!(*tree)) {
		*tree = (nodo *)malloc(sizeof(nodo));
		(*tree)->left = (*tree)->right = NULL;
		(*tree)->val = (info*) malloc(sizeof(info));
		(*tree)->val->nombre = (char*) malloc(strlen(item->nombre));
		(*tree)->val->nombre = item->nombre;
		(*tree)->val->tipo = item->tipo;
		if (item->tipo == 'v') (*tree)->val->valor = item->valor;
		else if (item->tipo == 'f') (*tree)->val->funcion = item->funcion;
	}
	if(strcmp(item->nombre,(*tree)->val->nombre)<0)
		insertar(&(*tree)->left, item);
	else if(strcmp(item->nombre,(*tree)->val->nombre)>0)
		insertar(&(*tree)->right, item);
}

// buscar variable en la tabla
double buscar(nodo ** tree, char * item) {
	if (!(*tree)) {
		//errorTS("No existe el nodo", TS_NOT_FOUND);
		return 0;
	}
	if(!strcmp((*tree)->val->nombre, item) && (*tree)->val->tipo=='v') {
		return (*tree)->val->valor;
	}
	if(strcmp(item,(*tree)->val->nombre)<0)
		return buscar(&(*tree)->left, item);
	else if(strcmp(item,(*tree)->val->nombre)>0)
		return buscar(&(*tree)->right, item);

	errorTS("No se encuentra la variable", TS_NOT_FOUND);
	return 0;
}

// buscar funcion en la tabla (devuelve el nodo)
info * buscarF(nodo ** tree, char * item) {
	if (!(*tree)) {
		errorTS("No existe el nodo", TS_NOT_FOUND);
		return (info*) NULL;
	}
	if(!strcmp((*tree)->val->nombre, item) && (*tree)->val->tipo=='f') {
		return (*tree)->val;
	}
	if(strcmp(item,(*tree)->val->nombre)<0)
		return buscarF(&(*tree)->left, item);
	else if(strcmp(item,(*tree)->val->nombre)>0)
		return buscarF(&(*tree)->right, item);

	errorTS("No se encuentra la funcion", TS_NOT_FOUND);
	return 0;
}

void imprimir(nodo * tree) {
	if(tree->left) imprimir(tree->left);
	if (tree->val->tipo == 'v') printf("%-15s%f\n",tree->val->nombre,tree->val->valor);
	if(tree->right) imprimir(tree->right);
}

void suprimir(nodo ** tree)
{
	if((*tree)->left) suprimir(&(*tree)->left);
	if((*tree)->right) suprimir(&(*tree)->right);
	free (*tree);
	*tree = NULL;
}
