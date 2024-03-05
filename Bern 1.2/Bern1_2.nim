proc Bernstein(i, n: int, u: float, B: var float) =
  var temp: array[0..100, float]  
  for j in 0..n:  
    temp[j] = 0.0
  temp[n-i] = 1.0  
  var ul: float = 1.0 - u
  for k in 1..n:
    for j in n..k:  
      temp[j] = ul * temp[j] + u * temp[j-1]
  B = temp[n]

# Ejemplo de uso:
var BResult: float
let i = 1
let n = 3
let u = 0.5
Bernstein(i, n, u, BResult)
echo "El resultado del polinomio de Bernstein para i = ", i, ", n = ", n, " y u = ", u, " es: ", BResult