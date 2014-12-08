%{
/* Librerias */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#include "sintactico.tab.h"
/* Librerias propias */
#include "tabla_simbolos.h"
//extern YYSTYPE yylval;
extern FILE* yyin;

void yyerror(const char* s)
{
	fprintf (stderr, "%s\n", s);
}

%}

%left '-' '+'
%left '*' '/'
%right '^'
%union {
	char* str;
	double num;
}
%token <num> NUM
%token <str> ID
%type <num> exp
%%

input: /* vacio */
	| input line

line: '\n'		/* Salto de linea */
	| exp ';' { printf("\t-> %g\n", $1); }
	| quit
;

quit: '@'	{ YYACCEPT; } /* Salir del programa */
;

exp:  NUM			{ $$ = $1; 				}
	| ID 			{ $$ = obtenerValor($1);}
	| exp '+' exp 	{ $$ = $1 + $3;			}
	| exp '-' exp 	{ $$ = $1 - $3;			}
	| exp '*' exp 	{ $$ = $1 * $3; 		}
	| exp '/' exp 	{ $$ = $1 / $3; 		}
	| '-' exp 		{ $$ = -$2;	   			}
	| exp '^' exp 	{ $$ = pow($1, $3);		}
	| '(' exp ')'	{ $$ = $2;				}
	| ID '=' exp	{
		token* T = (token*) malloc(sizeof(token));
		T->lexema = (char*) malloc(strlen($1)*sizeof(char));
		strcpy(T->lexema, $1);
		T->valor = $3;
		insertarTabla(T);
		$$ = $3;
	}
	| ID '(' exp ')' {
		if (!strcmp($1, "sin")) {
			$$ = sin($3);
		} else if (!strcmp($1, "cos")) {
			$$ = cos($3);
		}
	}
;

%%

int main (int argc, char** argv)
{
	++argv, --argc; /* Se salta el nombre del programa */
	if (argc > 0) yyin = fopen(argv[0], "r");
	else {
		printf("\n ->Introduce las expresiones seguidas de un ';'\n");
		printf(" ->Para finalizar introduce el caracter '@' y pulsa Intro\n\n");
		yyin = stdin;
	}

	// inicializamos la tabla de simbolos
	inicializarTabla();
	// ejecutamos el analisis
	yyparse();
	// Imprime la tabla de simbolos
	printf("-- Tabla de simbolos ---\n");
	imprimirTabla();
}
