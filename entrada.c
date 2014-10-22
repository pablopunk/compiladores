
//
// Implementacion del sistema de entrada
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
// Librerias propias
#include "entrada.h"

// Macros
#define FILEMODE "r" // Modo de apertura del archivo
#define N 128 // Tamano del buffer
#define MAXBUFFERS 2 // Numero de buffers que usamos

// Variables globales
char nombreArchivo[64];
FILE* pFile; // puntero al archivo
char* buffer[MAXBUFFERS]; // buffers de entrada ( 2 bloques por el metodo del centinela )
char* inicio; // Puntero al inicio del lexema
char* delantero; // Puntero al caracter que estamos leyendo
int leyendoBuffer=0; // Numero de buffer que leimos de ultimo

void cargarBuffer(int n)
{
	int i=0;
	char c;

	if (n == MAXBUFFERS) n = 0; // Volemos al primer buffer

	leyendoBuffer = n; // Actualizamos el ultimo buffer leido

	while ( (i<N) && ((c = fgetc(pFile)) != EOF) ) { // Leo N caracteres del archivo
		buffer[n][i++] = c;
	}
	buffer[n][i] = EOF; // Fin de fichero si i<N / si no, es el fin del buffer

	// actualizo el puntero delantero
	delantero = buffer[n];
}

// Funcion de lectura, devuelve 0 en caso de que no haya errores
int leerArchivo()
{
	char c;

	// Abro el archivo en modo lectura
	if ( (pFile = fopen(nombreArchivo, FILEMODE)) == NULL ) {
		printf("Error al leer archivo '%s'\n", nombreArchivo);
		return -1;
	}

	// Reservo memoria para el buffer
	buffer[0] = (char*) malloc((N+1) * sizeof(char));
	buffer[1] = (char*) malloc((N+1) * sizeof(char));

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
			return -1; // Devolvemos -1 para EOF
		}

		// Si estamos al final de un buffer
		cargarBuffer(++leyendoBuffer);
	}

	return *(delantero++);
}
