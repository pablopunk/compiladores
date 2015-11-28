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

int yylex();
void yyerror(const char* s)
{
	fprintf (stderr, "%s\n", s);
}

void imprimirAyuda()
{
	puts("");
	puts(" Introduce las operaciones y presiona Enter para ver el resultado");
	puts(" Las operaciones acabadas en ';' ocultan el resultado ");
	puts("   -> Ejemplo: z = 3e2 * sin (y + pi/6);");
	puts(" [Para finalizar introduce el caracter '@' y pulsa Enter]");
	puts("");
}

%}

%right '='
%left '-' '+'
%left '*' '/'
%left NEG
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

line: '\n'
	| exp '\n' { printf("> %g\n", $1); }
	| exp ';' /* se ejecuta pero sin salida */
	| quit
;

quit: '@'	{ YYACCEPT; } /* Salir del programa */
;

exp:  NUM					{ $$ = $1; 				  }
	| ID 						{ $$ = obtenerValor($1); }
	| ID '=' exp		{ insertarVariable($1, $3); $$ = $3; }
	| ID '(' exp ')' { info* f = buscarFuncion($1); $$ = f->funcion($3); }
	| exp '+' exp 	{ $$ = $1 + $3;			}
	| exp '-' exp 	{ $$ = $1 - $3;			}
	| exp '*' exp 	{ $$ = $1 * $3; 		}
	| exp '/' exp 	{ $$ = $1 / $3; 		}
	| '-' exp  %prec NEG { $$ = -$2; 		}
	| exp '^' exp 	{ $$ = pow($1, $3);	}
	| '(' exp ')'		{ $$ = $2;					}
;

%%

int main (int argc, char** argv)
{
	++argv, --argc; /* Se salta el nombre del programa */
	if (argc > 0) yyin = fopen(argv[0], "r");
	else {
		imprimirAyuda();
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
