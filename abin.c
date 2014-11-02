
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "abin.h"

void insertar(nodo ** tree, char* item) {
	if(!(*tree)) {
		*tree = (nodo *)malloc(sizeof(nodo));
		(*tree)->left = (*tree)->right = NULL;
		(*tree)->val = (char*) malloc(strlen(item)*sizeof(char));
		(*tree)->val = item;
		return;
	}
	if(strcmp(item,(*tree)->val)<0)
		insertar(&(*tree)->left, item);
	else if(strcmp(item,(*tree)->val)>0)
		insertar(&(*tree)->right, item);
}

int existe(nodo ** tree, char* item) {
	if (!(*tree)) {
		return 0;
	}
	if(!strcmp((*tree)->val,item)) {
		return 1;
	}
	if(strcmp(item,(*tree)->val)<0)
		return existe(&(*tree)->left, item);
	else if(strcmp(item,(*tree)->val)>0)
		return existe(&(*tree)->right, item);

	return 0;
}

void imprimir(nodo * tree) {
	if(tree->left) imprimir(tree->left);
	printf("%s\n",tree->val);
	if(tree->right) imprimir(tree->right);
}
