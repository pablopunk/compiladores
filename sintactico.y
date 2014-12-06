%{
/* Librerias */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* Librerias propias */
#include "tabla_simbolos.h"
#include "definiciones.h"

extern int yylex(void);
extern char *yytext;
extern FILE* yyin;
void yyerror(char* s);

%}

%token NUM
%left '-' '+' /* Resta y suma */
%left '*' '/' /* Multiplicacion y division */
%left NEG     /* Menos */
%right '^'    /* Potenciacion */
%%
/* Gramatica */

exp:	NUM			{ $$ = $1;	}
      | exp '+' exp		{ $$ = $1 + $3;	}
      | exp '-' exp		{ $$ = $1 - $3;	}
      | exp '*' exp		{ $$ = $1 * $3;	}
      | exp '/' exp		{ $$ = $1 / $3;	}
      | '-' exp %prec NEG	{ $$ = -$2; 	}
      | exp '^' exp		{ $$ = pow ($1, $3);	}
      | '(' exp ')'		{ $$ = $2;	}
;

%%

int main (int argc, char** argv)
{
	++argv, --argc; /* Se salta el nombre del programa */
	if (argc > 0) yyin = fopen(argv[0], "r");
	else yyin = stdin;

	// inicializamos la tabla de simbolos
	inicializarTabla();

	// ejecutamos el analisis
	yyparse();
}
