
//
// Implementacion del sistema de entrada
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Librerias propias
#include "entrada.h"

// Macros
#define FILEMODE "r" // Modo de apertura del archivo
#define N 4096 // Tamano del buffer
#define MAXBUFFERS 2 // Numero de buffers que usamos

// Variables globales
char nombreArchivo[64];
FILE* pFile; // puntero al archivo
char buffer[MAXBUFFERS][N+1]; // buffers de entrada ( 2 bloques por el metodo del centinela )
char* inicio; // Puntero al inicio del lexema
char* delantero; // Puntero al caracter que estamos leyendo
int leyendoBuffer=0; // Numero de buffer que leimos de ultimo
int bufferDeInicio=0; // Numero de buffer donde esta el puntero de inicio
int flag; // es 1 para no volver a cargar el buffer en los retrocesos

void cargarBuffer(int n)
{
	int leidos=0;

	if (n < 0 || n >= MAXBUFFERS) n = 0; // Volemos al primer buffer

	leyendoBuffer = n; // Actualizamos el ultimo buffer leido

	leidos = fread(buffer[n], 1, N, pFile); // Leo N bytes(1) del archivo

	buffer[n][leidos] = EOF; // Fin de fichero si leidos<N / si no, es el fin del buffer (centinela)

	// actualizo el puntero delantero
	delantero = buffer[n];
}

// Funcion de lectura, devuelve 0 en caso de que no haya errores
int leerArchivo()
{

	// Abro el archivo en modo lectura
	if ( (pFile = fopen(nombreArchivo, FILEMODE)) == NULL ) {
		printf("Error al leer archivo '%s'\n", nombreArchivo);
		return -1;
	}

	// Cargo el primer buffer
	cargarBuffer(0);

	inicio = delantero = buffer[0]; // Inicio los punteros

	return 0;
}

// Devuelve 1 si estamos en el fin del fichero
int esFinDeFichero()
{
	if (feof(pFile)) {
		fclose(pFile); // Cerramos el archivo
		return 1;
	}

	return 0;
}

// Funcion que devuelve el siguiente caracter del buffer (-1 para EOF)
char siguienteCaracter()
{
	if (*delantero == EOF) {
		if (esFinDeFichero()) {
			return EOF; // Devolvemos fin de fichero
		}

		// Si estamos al final de un buffer, cargamos el siguiente si flag es 0
		if (!flag) {
			cargarBuffer(++leyendoBuffer);
		} else {
			delantero = buffer[leyendoBuffer-1];
			flag = 0;
		}
	}

	return *(delantero++);
}

// Mover el puntero de inicio de lexema al caracter actual
void moverInicio()
{
	inicio = delantero;
}

// Obtener lexema desde el puntero de inicio, tamaño offset
char* lexemaActual(int offset)
{
	char* string = (char*) malloc(offset*sizeof(char));
	int i = 0;

	// printf("\ninicio: %s\ndelantero: %s\n\n", inicio, delantero);
	// printf("( %i )\n", offset);

	if (bufferDeInicio >= MAXBUFFERS) {
		bufferDeInicio = 0;
	}

	if (*inicio == EOF) {
		inicio = buffer[bufferDeInicio++];
	}

	for (i=0; i < offset; i++) {

		string[i] = *(inicio++);

		if (*inicio == EOF) {
			inicio = buffer[bufferDeInicio++];
		}
	}

	return string;
}

// Retroceder delantero 1 caracter
void retroceder1()
{
	int i = 0;

	for (i = 0; i < MAXBUFFERS; i++) { // Miro si estoy al comienzo de un buffer
		if (delantero == buffer[i]) {
			flag = 1;
			break;
		}
	}

	if (flag) {
		if (i == 0) {
			delantero = buffer[MAXBUFFERS-1]+(N-1); // Apuntamos delantero al ultimo caracter del anterior buffer
		} else {
			delantero = buffer[i-1]+(N-1); // Apuntamos delantero al ultimo caracter del anterior buffer
		}
	} else {
		delantero--;
	}
}

// Retroceder puntero delantero offset caracteres
void retroceder(int offset)
{
	int i=0;

	flag = 0;

	for (i = 0; i < offset; i++) {
		retroceder1();
	}
}
