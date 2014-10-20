
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
#define N 4096 // Tamano del buffer

// Variables globales
char nombreArchivo[64];
FILE* pFile; // puntero al archivo
char* buffer[2]; // buffers de entrada ( 2 bloques por el metodo del centinela )
char* inicio; // Puntero al inicio del lexema
char* delantero; // Puntero al caracter que estamos leyendo
int leyendoBuffer; // Numero de buffer que leimos de ultimo

void cargarBuffer(int n)
{
	int i=0;
	char c;

	if (n == 2) {
		n = leyendoBuffer = 0;
	}

	while ( (c = fgetc(pFile)) != EOF && (i<N) ) { // Leo N caracteres del archivo
		buffer[n][i++] = c;
	}
	buffer[n][i] = EOF; // Fin de fichero -
	buffer[n][N] = EOF; // Fin de buffer  - Puede coincidir con el fin de fichero
}

// Funcion de lectura, devuelve 0 en caso de que no haya errores
int leerArchivo()
{
	char c;
	int count=0, numeroBuffer=0;

	if (pFile == NULL) { // Aun no he abierto el archivo
		// Abro el archivo en modo lectura
		if ( (pFile = fopen(nombreArchivo, FILEMODE)) == NULL ) {
			printf("Error al leer archivo '%s'\n", nombreArchivo);
			return -1;
		}
	}

	// Reservo memoria para el buffer
	buffer[0] = (char*) malloc((N+1) * sizeof(char));
	buffer[1] = (char*) malloc((N+1) * sizeof(char));

	cargarBuffer(0);
	cargarBuffer(1);

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
