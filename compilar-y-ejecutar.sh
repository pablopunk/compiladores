#!/bin/bash

gcc entrada.c -c && gcc -o lexico lexico.c entrada.o && ./lexico bisection.jl
