
%{

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#include "sintactico.tab.h"
#include "errores.h"

%}

DIGITO 	[0-9]
FLOAT	{DIGITO}+["."|"e"]{DIGITO}+
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
"@"			return(yytext[0]);		/* SALIR */
[\n]		return(yytext[0]); 		/* Salto de linea */
[ \t]+ /* ignoro los espacios en blanco y tabulaciones */

. errorLex("Caracter no reconocido", LEX_UNKNOWN);

%%
