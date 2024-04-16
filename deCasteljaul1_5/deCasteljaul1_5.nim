proc deCasteljau(P: seq[tuple[x, y: float]], n: int, u: float): tuple[x, y: float] =
  var Q = P  # Usamos una matriz local para no modificar los puntos de control originales
  for i in 0..n:
    Q[i] = P[i]
  for k in 1..n:
    for i in 0..n-k:
      let l = 1.0
      Q[i] = ((l - u) * Q[i][0] + u * Q[i + 1][0], (l - u) * Q[i][1] + u * Q[i + 1][1])

  return Q[0]

# Ejemplo de uso:
let P = @[(0.0, 0.0), (1.0, 1.0), (2.0, 2.0), (3.0, 3.0)]  # Puntos de control
let n = 3  # Grado de la curva (número de puntos de control - 1)
let u = 0.5  # Valor de u
let C = deCasteljau(P, n, u)
echo "El punto en la curva de Bézier para u = ", u, " es: ", C
