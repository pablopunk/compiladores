
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "abin.h"

void insertar(nodo ** tree, lexema * item) {
	if(!(*tree)) {
		*tree = (nodo *)malloc(sizeof(nodo));
		(*tree)->left = (*tree)->right = NULL;
		(*tree)->val = (lexema*) malloc(sizeof(lexema));
		(*tree)->val->string = (char*) malloc(strlen(item->string));
		(*tree)->val->string = item->string;
		(*tree)->val->numero = item->numero;
		(*tree)->val->linea = item->linea;
		return;
	}
	if(strcmp(item->string,(*tree)->val->string)<0)
		insertar(&(*tree)->left, item);
	else if(strcmp(item->string,(*tree)->val->string)>0)
		insertar(&(*tree)->right, item);
}

int existe(nodo ** tree, lexema * item) {
	if (!(*tree)) {
		return 0;
	}
	if(!strcmp((*tree)->val->string, item->string)) {
		return 1;
	}
	if(strcmp(item->string,(*tree)->val->string)<0)
		return existe(&(*tree)->left, item);
	else if(strcmp(item->string,(*tree)->val->string)>0)
		return existe(&(*tree)->right, item);

	return 0;
}

void imprimir(nodo * tree) {
	if(tree->left) imprimir(tree->left);
	printf("%s\n",tree->val->string);
	if(tree->right) imprimir(tree->right);
}

void suprimir(nodo ** tree)
{
	if((*tree)->left) suprimir(&(*tree)->left);
	if((*tree)->right) suprimir(&(*tree)->right);
	free (*tree);
	*tree = NULL;
}
