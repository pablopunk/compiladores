function bisection(f, range, nmax=Inf)
  a, b = range
  if a >= b || sign(f(a)) == sign(f(b))
    error("El rango especificado no es válido")
  end
  n = 1
  while n <= nmax
    c = (a + b)/2.0
    if f(c) == 0 || (b-a)/2.0 < eps() #Resultado encontrado
      return c
    end
    n += 1
    if sign(f(c)) == sign(f(a))
      a = c
    else
      b = c
    end
  end
  error("Se ha superado el número máximo de iteraciones")
end

##### Main script #####
f(x) = 0.03x^4-(1//3)x^3+x^2-15*x-8  #Definición del polinomio
x1 = -4.0; x2 = 0x4
nmax = 10
try
  sol = bisection(f, (x1, x2), nmax)
catch e
  println("$nmax iteraciones no son suficientes")
end
sol = bisection(f, (x1, x2))
println("Solución encontrada en x=$sol")
