all:
	make sin_inlining && make con_inlining
O0:
	gcc -o sin_inlining sin_inlining.c -O0 && gcc -o con_inlining con_inlining.c -O0
O1:
	gcc -o sin_inlining sin_inlining.c -O1 && gcc -o con_inlining con_inlining.c -O1
O2:
	gcc -o sin_inlining sin_inlining.c -O2 && gcc -o con_inlining con_inlining.c -O2
O3:
	gcc -o sin_inlining sin_inlining.c -O3 && gcc -o con_inlining con_inlining.c -O3