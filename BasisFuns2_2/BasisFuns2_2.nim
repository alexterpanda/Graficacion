proc BasisFuns(i: int, u: float, p: int, U: seq[float], N: var seq[float]) =
  # Compute the nonvanishing basis functions
  # Input: i, u, p, U
  # Output: N
  var left = newSeq[float](p+1)
  var right = newSeq[float](p+1)
  N[0] = 1.0
  for j in 1..p:
    left[j] = u - U[i+1-j]
    right[j] = U[i+j] - u
    var saved = 0.0
    for r in 0..<j:
      var temp = N[r] / (right[r+1] + left[j-r])
      N[r] = saved + right[r+1] * temp
      saved = left[j-r] * temp
    N[j] = saved


# Ejemplo de uso:
let i = 2  # Índice de nodo
let u = 0.5  # Valor de u
let p = 2  # Grado del spline
let U = @[0.0, 0.0, 0.5, 1.0, 1.0, 1.0]  # Nodos
var N = newSeq[float](p+1)  # Secuencia para almacenar los valores de N
BasisFuns(i, u, p, U, N)
echo "Los valores de las funciones de base no nulas son: ", N
