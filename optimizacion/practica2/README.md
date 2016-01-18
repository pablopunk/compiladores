## Ejercicio 16

El script `exe.sh` compila y ejecuta todas las combinaciones de optimizaciones y tamaño de matriz. Estas pueden ser configuradas en el propio script:

##### Optimizaciones

Podemos cambiar las opciones `-O` del compilador en esta linea del script (de `O0` a `O3`):
```
o_list=`seq 0 3`
```

##### Tamaño de matriz

En la siguiente linea tambien podemos cambiar los distintos tamaños de la matriz (de 100 a 400 con un intervalo de 100):
```
n_list=`seq 100 100 400`
```

##### Número de CPUs

En el script también se configura el número de CPUs del PC para poder paralelizarlo. Se pueden configurar menos CPUs de las que en realidad hay, si no se desea usar todas, pero nunca se debe poner un número mayor ya que los resultados de tiempos serán inconsistentes:
```
NR_CPUS=4
```

### Salida

Los tiempos de las ejecuciones se guardan en el archivo `resultados/resultados.csv` y los binarios se guardan en `bin/`
