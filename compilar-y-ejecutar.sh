#!/bin/bash

gcc entrada.c -c && gcc lexico.c -c && gcc -o sintactico sintactico.c entrada.o lexico.o && ./sintactico bisection.jl
