O0:
	gcc -o out main.c -O0 -fomit-frame-pointer -masm=intel
O1:
	gcc -o out main.c -O1 -fomit-frame-pointer -masm=intel
O2:
	gcc -o out main.c -O2 -fomit-frame-pointer -masm=intel
O3:
	gcc -o out main.c -O3 -fomit-frame-pointer -masm=intel
