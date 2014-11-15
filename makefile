all:
	mv sintactico.c sintactico.flex && flex sintactico.flex && gcc -o compilador -g *.c -lfl && mv sintactico.flex sintactico.c

osx:
	mv sintactico.c sintactico.flex && flex sintactico.flex && gcc -o compilador -g *.c -ll && mv sintactico.flex sintactico.c

linux:
	mv sintactico.c sintactico.flex && flex sintactico.flex && gcc -o compilador -g *.c -lfl && mv sintactico.flex sintactico.c
