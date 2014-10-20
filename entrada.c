
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
int leyendoBuffer=0; // Guarda en que buffer esta delantero (0 o 1)

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

	while ( (c = fgetc(pFile)) != EOF ) {
		if (count < N) {
			buffer[numeroBuffer][count++] = c; // Guardo cada caracter en el buffer

		} else if (count == N) { // Si estamos en el fin del buffer
			if (numeroBuffer == 0) {
				// Buffer 1
				buffer[0][N] = EOF; // Centinela
				buffer[1][0] = c;
				count = 1;
				numeroBuffer++;
			
			} else {
				// Buffer 2
				buffer[1][N] = EOF; // Centinela
				fseek(pFile, -1, SEEK_CUR); // Retornamos un caracter porque no lo hemos guardado aun
				break; // Buffers completos
			} 
		}

	}

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
		else if (leyendoBuffer == 0) { // Si estamos en el buffer 0
			leyendoBuffer++;
			delantero = buffer[1];
			return *(delantero++);
		} 
		// si estamos en el buffer 1
		leerArchivo();
		delantero = buffer[0];
		leyendoBuffer = 0;
	}
	return *(delantero++);
}
