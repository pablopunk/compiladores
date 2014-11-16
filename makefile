all:
	flex sintactico.flex && gcc -o compilador -g *.c -lfl
osx:
	flex sintactico.flex && gcc -o compilador -g *.c -ll 
linux:
	flex sintactico.flex && gcc -o compilador -g *.c -lfl