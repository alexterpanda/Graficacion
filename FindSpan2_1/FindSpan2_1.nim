proc FindSpan(n, p: int, u: float, U: seq[float]): int =
  # Determine the knot span index
  # Input: n, p, u, U
  # Return: the knot span index
  if u == U[n+1]:
    return n  # Special case
  var low = p
  var high = n + 1  # Do binary search
  var mid = (low + high) div 2
  while u < U[mid] or u >= U[mid+1]:
    if u < U[mid]:
      high = mid
    else:
      low = mid
    mid = (low + high) div 2
  result = mid

# Ejemplo de uso:
let n = 5  # Número de nodos - 1
let p = 2  # Grado del spline
let u = 0.4  # Valor de u
let U = @[0.0, 0.0, 0.0, 0.5, 1.0, 1.0, 1.0]  # Nodos
let spanIndex = FindSpan(n, p, u, U)
echo "El índice del intervalo de nodos para u = ", u, " es: ", spanIndex