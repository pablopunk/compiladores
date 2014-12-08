
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "abin.h"

void insertar(nodo ** tree, token * item) {
	if(!(*tree)) {
		*tree = (nodo *)malloc(sizeof(nodo));
		(*tree)->left = (*tree)->right = NULL;
		(*tree)->val = (token*) malloc(sizeof(token));
		(*tree)->val->lexema = (char*) malloc(strlen((*item).lexema)*sizeof(char));
		(*tree)->val->lexema = (*item).lexema;
		(*tree)->val->valor = (*item).valor;
		return;
	}
	if(strcmp((*item).lexema,(*tree)->val->lexema)<0)
		insertar(&(*tree)->left, item);
	else if(strcmp((*item).lexema,(*tree)->val->lexema)>0)
		insertar(&(*tree)->right, item);
	/* Si es igual obviamente ya existe y lo actualiza */
	else if(!strcmp((*item).lexema,(*tree)->val->lexema)) {
		(*tree)->val->valor = (*item).valor;
	}
}

int existe(nodo ** tree, token * item) {
	if (!(*tree)) {
		return 0;
	}
	if(!strcmp((*tree)->val->lexema,(*item).lexema)) {
		return 1;
	}
	if(strcmp((*item).lexema,(*tree)->val->lexema)<0)
		return existe(&(*tree)->left, item);
	else if(strcmp((*item).lexema,(*tree)->val->lexema)>0)
		return existe(&(*tree)->right, item);

	return 0;
}

void imprimir(nodo * tree) {
	if(tree->left) imprimir(tree->left);
	printf("%s := %.2f\n",tree->val->lexema,tree->val->valor);
	if(tree->right) imprimir(tree->right);
}

void suprimir(nodo ** tree)
{
	if((*tree)->left) suprimir(&(*tree)->left);
	if((*tree)->right) suprimir(&(*tree)->right);
	free (*tree);
	*tree = NULL;
}

double devolver(nodo ** tree, char* variable)
{
	if (!(*tree)) {
		printf("No se reconoce la variable %s\n", variable);
		return 0;
	}
	if(!strcmp((*tree)->val->lexema,variable)) {
		return (*tree)->val->valor;
	}
	if(strcmp(variable,(*tree)->val->lexema)<0)
		return devolver(&(*tree)->left, variable);
	else if(strcmp(variable,(*tree)->val->lexema)>0)
		return devolver(&(*tree)->right, variable);

	return 0;
}