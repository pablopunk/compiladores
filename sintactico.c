
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

DIGITO	[0-9] // Numeros
ID		[a-z][a-z0-9]*

%x comentario comentarioMono
%%

"#="	BEGIN(comentario);
"#"		BEGIN(comentarioMono);
<comentario>[^=\n]*		/* ignora todo lo que no sea '=' */
<comentario>"*"+[^=#\n]	/* ignora los '=' que no siguen con '#' */
<comentario>\n			++numlinea; /* tambien contamos las lineas */
<comentario>"="+"#"		BEGIN(INITIAL); /* salimos del comentario */
<comentarioMono>[^\n]*	/* ignora todo hasta el salto de linea */
<comentarioMono>\n {
	++numlinea;
	BEGIN(INITIAL);
}

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
