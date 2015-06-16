
//
// Implementacion del analisis lexico
//

// Librerias de C
#include <stdio.h>
#include <stdlib.h>
// Librerias propias
#include "entrada.h"

int main() 
{
	char c;
	int i = 0;
	
	leerArchivo();

	for (i=0; i<3; i++) {
		c = siguienteCaracter(); 
	}
	
	marcarInicio();
	
	for (i=0; i<8; i++) {
		c = siguienteCaracter(); 
	}
	
	printf("%s\n", lexemaActual());
	
	// while ( (c = siguienteCaracter()) != -1) { // no es EOF
	// 	printf("%c", c);
	// }

	puts("");
}
