
/*
 * Fichero de definiciones
 */

/* Tokens */
#ifndef YYTOKENTYPE
#define YYTOKENTYPE
enum yytokentype {
	INT = 257,
	FLOAT = 258,
	ID = 259
};
#endif

#define INT 257
#define FLOAT 258
#define ID 259

extern YYSTYPE yylval;
extern char *yytext;
extern FILE* yyin;