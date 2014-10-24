
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
			return EOF; // Devolvemos fin de fichero
		}

		// Si estamos al final de un buffer
		cargarBuffer(++leyendoBuffer);
	}

	return *(delantero++);
}

// Mover el puntero de inicio de lexema al caracter actual
void moverInicio()
{
	inicio = delantero-1;
}

// Obtener lexema desde el puntero de inicio, tamaño offset
char* lexemaActual(int offset)
{
	char* string = (char*) malloc(offset*sizeof(char));

	int i = 0, j;
	int bufferDeInicio=0; // Buffer donde esta el puntero Inicio

	for (j=0; j<MAXBUFFERS; j++) { // Miramos en que buffer esta Inicio
		if (inicio < buffer[j]+N) {
			bufferDeInicio = j;
			break;
		}
	}

	//printf("inicio: %c\tdelantero: %c\n", *inicio, *delantero);

	do {
		string[i++] = *inicio; // guardo el caracter

		if ( (inicio == (buffer[bufferDeInicio]+N)) && (bufferDeInicio<MAXBUFFERS) ) {
			inicio = buffer[++bufferDeInicio]; // Continuamos con inicio en el siguiente buffer
		} else if ( (inicio == (buffer[bufferDeInicio]+N)) && (bufferDeInicio==MAXBUFFERS) ) {
			inicio = buffer[0]; // volvemos al primer buffer
		} else {
			inicio++; // seguimos en el mismo buffer
		}
	} while (i < offset);

	return string;
}

// Retroceder puntero delantero 1 caracter
void retroceder()
{
	delantero--;
}
