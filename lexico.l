
%{

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>	

#include "sintactico.tab.h"

int numlinea = 1; /* Lleva la cuenta de las lineas */

%}

DIGITO 	[0-9]
FLOAT	{DIGITO}+"."{DIGITO}+
ID		[a-z|A-Z][a-z0-9|A-Z0-9]*

%%

{DIGITO}+ {
	yylval.num = atof(yytext);
	return NUM;
}
{FLOAT} {
	yylval.num = atof(yytext);
	return NUM;
}
{ID} {
	yylval.str = strdup(yytext);
	return ID;
}
"="			return(yytext[0]);		/* Asignacion */
"("			return(yytext[0]);		/* Parentesis 1 */
")"			return(yytext[0]);		/* Parentesis 2 */
";"			return(yytext[0]);		/* Fin de expresion */
"*"			return(yytext[0]);		/* Multiplicar */
"/"			return(yytext[0]);		/* Dividir */
"^"			return(yytext[0]);		/* Elevar */
"+"			return(yytext[0]);		/* Sumar */
"-"			return(yytext[0]);		/* Restar */
[ \t]+ /* ignoro los espacios en blanco y tabulaciones */
[\n]			   numlinea++; 		/* Cuento las lineas */

. printf(" -> Caracter '%s' no reconocido\n", yytext); /* No reconocido */

%%

