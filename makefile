all:
	gcc ej4.c -O1 -fomit-frame-pointer -masm=intel -o O1.out && gcc ej4.c -O1 -funroll-loops -fomit-frame-pointer -masm=intel -o funroll.out
