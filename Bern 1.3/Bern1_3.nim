proc Bernstein(n: int, u: float, B: var seq[float]) =
  B[0] = 1.0
  var ul = 1.0 - u
  for j in 1..n:
    var saved = 0.0
    for k in 0..<j:
      var temp = B[k]
      B[k] = saved + ul * temp
      saved = u * temp
    B[j] = saved

# Ejemplo de uso:
var B: seq[float] = newSeq[float](4) 
let n = 3
let u = 0.5
Bernstein(n, u, B)
echo "Los coeficientes del polinomio de Bernstein para n = ", n, " y u = ", u, " son: ", B
