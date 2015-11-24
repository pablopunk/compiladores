all:
	bison -d sintactico.y && flex lexico.l && gcc *.c -o compilador -lfl -lm
osx:
	bison -d sintactico.y && flex lexico.l && gcc *.c -o compilador -ll -lm
linux:
	bison -d sintactico.y && flex lexico.l && gcc *.c -o compilador -lfl -lm
