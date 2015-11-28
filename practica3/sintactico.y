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
	puts(" './calculadora -h' -> muestra este menú");
	puts(" './calculadora archivo_entrada.txt' -> muestra la salida de los comandos");
	puts("                                        y la tabla de simbolos final\n");
	puts(" Introduce las operaciones y presiona Enter para ver el resultado");
	puts(" (las operaciones acabadas en ';' ocultan el resultado)");
	puts("   -> Ejemplo: 'z = 3e2 * sin (y + pi/6); y' -> opera sin mostrar el resultado");
	puts("                                                e imprime el valor de y\n");
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
	if (argc > 0) {
		if (!strcmp(argv[0],"-h")) {
			imprimirAyuda(); exit(0);
		} else {
			yyin = fopen(argv[0], "r");
		}
	} else {
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
