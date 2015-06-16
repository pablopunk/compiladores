
//
// Interfaz del sistema de entrada
//

char nombreArchivo[64];

// Funcion de lectura, devuelve 0 en caso de que no haya errores
int leerArchivo();

// Funcion que devuelve el siguiente caracter del buffer (-1 para EOF)
char siguienteCaracter();

// Funcion que marca el inicio del actual lexema a leer 
void marcarInicio();

// Obtener lexema desde el puntero de inicio hasta delantero
char* lexemaActual();