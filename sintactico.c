
%{

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Librerias propias
#include "tabla_simbolos.h"
#include "definiciones.h"

typedef struct {
	char* lexema;
	int numero;
	int linea;
} token;

int numlinea=1; /* Empezamos en la linea 1 no en la 0 */

%}

ENTERO		[0-9]+
ID			[a-z|A-Z][a-z0-9|A-Z0-9]*
HEX			[a-f|0-9]+

%x comentario comentarioMono string
%%

"#="	BEGIN(comentario);
"#"		BEGIN(comentarioMono);
"\"" {
	BEGIN(string);
	printf("%i\t", STRING);
	printf("\""); // Imprimo las comillas iniciales
}

<comentario>[^=\n]*		/* ignora todo lo que no sea '=' */
<comentario>\n			++numlinea; /* tambien contamos las lineas */
<comentario>"="+"#"		BEGIN(INITIAL); /* salimos del comentario */

<comentarioMono>[^\n]*	/* ignora todo hasta el salto de linea */
<comentarioMono>\n {	/* sumo el numero de linea y salgo del comentario */
	++numlinea;
	BEGIN(INITIAL);
}

<string>[^"\""]*	printf("%s", yytext); /* ignora todo hasta que no acabe el string pero lo imprimo */
<string>\n			++numlinea;
<string>"\"" {		/* imprimo las comillas finales y salgo del automata */
	printf("\"\n");
	BEGIN(INITIAL);
}

"function" printf("%i\t%s\n", FUNCTION, yytext);
"if" printf("%i\t%s\n", IF, yytext);
"sign" printf("%i\t%s\n", SIGN, yytext);
"error" printf("%i\t%s\n", ERROR, yytext);
"end" printf("%i\t%s\n", END, yytext);
"while" printf("%i\t%s\n", WHILE, yytext);
"eps" printf("%i\t%s\n", EPS, yytext);
"return" printf("%i\t%s\n", RETURN, yytext);
"else" printf("%i\t%s\n", ELSE, yytext);
"try" printf("%i\t%s\n", TRY, yytext);
"catch" printf("%i\t%s\n", CATCH, yytext);
"println" printf("%i\t%s\n", PRINTLN, yytext);
"Inf" printf("%i\t%s\n", INF, yytext);
"//" printf("%i\t%s\n", FRACTION, yytext);
">=" printf("%i\t%s\n", GREATEREQ, yytext);
"<=" printf("%i\t%s\n", LESSEQ, yytext);
"==" printf("%i\t%s\n", EQUALS, yytext);
"||" printf("%i\t%s\n", OR, yytext);

{ID} { /* Reconozco un identificador: lo meto en la tabla de simbolos y lo imprimo */
	insertarTabla(yytext);
	printf("%i\t%s\n", ID, yytext);
}

{ENTERO}"."{ENTERO} printf("%i\t%s\n", FLOAT, yytext); /* Imprimo el float */

{ENTERO} printf("%i\t%s\n", INT, yytext); /* Imprimo el entero */

"0x"{HEX} printf("%i\t%s\n", HEX, yytext); /* Imprimo el hexadecimal */

"("	printf("%i\t%s\n", '(', yytext);
")"	printf("%i\t%s\n", ')', yytext);
","	printf("%i\t%s\n", ',', yytext);
"="	printf("%i\t%s\n", '=', yytext);
"<"	printf("%i\t%s\n", '<', yytext);
">"	printf("%i\t%s\n", '>', yytext);
"^"	printf("%i\t%s\n", '^', yytext);
"-"	printf("%i\t%s\n", '-', yytext);
"+"	printf("%i\t%s\n", '+', yytext);
"*"	printf("%i\t%s\n", '*', yytext);
"/"	printf("%i\t%s\n", '/', yytext);
";"	printf("%i\t%s\n", ';', yytext);

[ \t]+ /* ignoro los espacios en blanco y las tabulaciones*/
[\n]	numlinea++; /* cuento los numeros de linea */

.	printf("-> Caracter '%s' no reconocido\n", yytext); /* Cualquier caracter que las reglas anteriores no hayan reconocido */

%% 

int main(int argc, char** argv)
{
	++argv, --argc;  /* se salta el nombre del programa */
    if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
    else
        yyin = stdin;
    
    // Inicializamos la tabla de simbolos
    inicializarTabla();

    // Analisis lexico
    yylex();

    printf("\nNumero de lineas: %d\n", numlinea);

	return 0;
}
