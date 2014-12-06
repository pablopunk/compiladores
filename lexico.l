
%{
int numlinea = 1; /* Lleva la cuenta de las lineas */
%}

ENTERO	[0-9]+
ID	[a-z|A-Z][a-z0-9|A-Z0-9]*

%%

{ID}			return(yytext); 	/* Identificador */
{ENTERO}"."{ENTERO} 	return(yytext); 	/* Float */
{ENTERO}		return(yytext);		/* Entero */
"="			return(yytext);		/* Asignacion */
"("			return(yytext);		/* Parentesis 1 */
")"			return(yytext);		/* Parentesis 2 */
";"			return(yytext);		/* Fin de expresion */
"*"			return(yytext);		/* Multiplicar */
"/"			return(yytext);		/* Dividir */
"^"			return(yytext);		/* Elevar */
"+"			return(yytext);		/* Sumar */
"-"			return(yytext);		/* Restar */
[\n]			numlinea++;		/* Salto de linea */
[ \t]+ /* ignoro los espacios en blanco y tabulaciones */

. printf(" -> Caracter '%s' no reconocido\n", yytext); /* No reconocido */

%%

