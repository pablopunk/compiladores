
//
// Interfaz del sistema de entrada
//

char nombreArchivo[64];

// Funcion de lectura, devuelve 0 en caso de que no haya errores
int leerArchivo();

// Funcion que devuelve el siguiente caracter del buffer (-1 para EOF)
char siguienteCaracter();

// Mover el puntero de inicio de lexema al caracter actual
void moverInicio();

// Obtener lexema desde el puntero de inicio hasta delantero
char* lexemaActual();

// Retroceder puntero delantero 1 caracter
void retroceder();