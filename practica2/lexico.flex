%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "lexico.h"
#include "errores.h"
#include "definiciones.h"
#include "tabla_simbolos.h"

#define FILEMODE "r"

FILE* fp;
int numlinea=1;
int retornarVarEnString=0; // 0=no 1=var-string 2=string
char* var;
char* string2;

int yylex();
void yyerror(const char *s);

// Reservamos memoria
void inicializarLexico(char* archivo)
{
  if ( (fp = fopen(archivo, FILEMODE)) == NULL) {
    errorArchivo("No se puede abrir el archivo", FILE_OPEN);
    yyin = stdin;
  } else {
    yyin = fp;
  }
}

// Liberamos memoria
void liberarLexico()
{
  if (fp != NULL) fclose(fp);
}

// comprobar variable dentro de string
int varEnString(char* string)
{
  char* pch;
  pch = strchr(string, '$');
  return pch == NULL ? -1 : pch-string+1;
}

// siguiente componente lexico
lexema * siguienteLexema()
{
  lexema * token = (lexema *) malloc(sizeof(lexema));

  if (retornarVarEnString == 1) {
    retornarVarEnString = 2;
    token->string = (char*) malloc(strlen(var)*sizeof(char));
    strcpy(token->string, var);
    token->linea = numlinea;
    token->numero = insertarTabla(token);
    return token;
  } else if (retornarVarEnString == 2) {
    retornarVarEnString = 0;
    if (strlen(string2)) {
      token->string = (char*) malloc(strlen(string2)*sizeof(char));
      strcpy(token->string, string2);
      token->linea = numlinea;
      token->numero = STRING;
      return token;
    }
  }

  int valor = yylex();
  token->string = (char *) malloc(sizeof(yylex));

  if (valor == -2) {
    errorLexico(yytext[0], "Caracter no reconocido", numlinea, CHAR_UNKNOWN);
    return NULL;
  }

  strcpy(token->string, yytext);
  token->numero = valor;
  token->linea = numlinea;

  if (valor == ID) { /* identificador */
    token->numero = insertarTabla(token);
  } else if (valor == 0) { /* fin de fichero */
    token->numero = -1;
  } else if (valor == '\n') {
      token->string = "\n";
  } else if (valor == STRING && (varEnString(token->string) != -1)) {
    int lugar = varEnString(token->string);
    int len = strlen(token->string);

    char old[len], *aux; strcpy(old, token->string);
    char* aux1 = (char*) calloc(1, len * sizeof(char));
    var = (char*) calloc(1, len * sizeof(char));
    char* aux2 = (char*) calloc(1, len * sizeof(char));

    strncpy(token->string, old, lugar);
    aux1 = token->string; aux1[lugar] = '\0';
    aux     = old+lugar;
    sscanf(aux, "%s %*[^\0]", var);
    aux2 = old + (strlen(aux1)+strlen(var)+1);
    //printf("string:%s\naux1:%s\nvar:%s\naux2(%lu):%s\n", old, aux1, var, strlen(aux2), aux2); // @debug
    if (!strcmp("$", aux1)) aux1 = ""; // borrar '$'
    else aux1[strlen(aux1)-1] = '\0';  // borrar '$'

    if (strlen(aux1)) { // string - var - string
      token->string = aux1;
      string2 = (char*) malloc(strlen(aux2));
      strcpy(string2, aux2);
      retornarVarEnString = 1; // queda var-string
    } else { // var - string
      strcpy(token->string, var);
      token->numero = insertarTabla(token);
      string2 = (char*) malloc(strlen(aux2));
      strcpy(string2, aux2);
      retornarVarEnString = 2; // queda string
    }

  }
  return token;
}

%}

ENTERO	[0-9]+
ID			[a-zA-Z][a-zA-Z0-9]*
HEX			[a-f0-9]+

%x comentario comentarioMono string
%%

"#="	BEGIN(comentario);
"#"		BEGIN(comentarioMono);
["] {
	BEGIN(string);
}

<comentario>[^=\n]*		/* ignora todo lo que no sea '=' */
<comentario>\n			++numlinea; /* tambien contamos las lineas */
<comentario>"="+"#"		BEGIN(INITIAL); /* salimos del comentario */

<comentarioMono>[^\n]* /* ignora todo hasta el salto de linea */
<comentarioMono>\n {	/* sumo el numero de linea y salgo del comentario */
	++numlinea;
	BEGIN(INITIAL);
}

<string>[^"]*	 { return STRING; } /* ignora todo hasta que acabe el string */
<string>["] {		 /* comillas finales -> salgo del automata */
	BEGIN(INITIAL);
}

"//" { return FRACTION; }
">=" { return GREATEREQ; }
"<=" { return LESSEQ; }
"==" { return EQUALS; }
"||" { return OR; }

{ID} { /* Reconozco un identificador */
  return ID;
}

{ENTERO}"."{ENTERO} { return FLOAT; } /* float */

{ENTERO} { return INT; } /* entero */

"0x"{HEX} { return HEX; } /* hexadecimal */

"("	{ return '('; }
")"	{ return ')'; }
","	{ return ','; }
"="	{ return '='; }
"<"	{ return '<'; }
">"	{ return '>'; }
"^"	{ return '^'; }
"-"	{ return '-'; }
"+"	{ return '+'; }
"*"	{ return '*'; }
"/"	{ return '/'; }
";"	{ return ';'; }

[ ]   /* ignoro los espacios */
[\t]+ { return '\t'; }
[\n]	{ numlinea++; return '\n'; }/* cuento los numeros de linea */

.	{ return -2; } /* Cualquier caracter que las reglas anteriores no hayan reconocido */
