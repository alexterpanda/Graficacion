import math

type
  Point = tuple[x, y: float]
  ControlPoints = seq[seq[Point]]

proc binomialCoefficient(n, k: int): int =
  # Calcula el coeficiente binomial (n, k)
  if k < 0 or k > n:
    return 0
  if k == 0 or k == n:
    return 1
  var result = 1
  for i in 0 .. min(k, n - k):
    result = result * (n - i) div (i + 1)
  return result

proc Bernstein(i, n: int, u: float): float =
  # Calcula el término de Bernstein para el parámetro u
  var coef: float = binomialCoefficient(n, i).float
  return coef * pow(u.float, i.float) * pow(1.0 - u, (n - i).float)

proc BezierSurface(u, v: float, controlPoints: ControlPoints): Point =
  # Calcula el punto en la superficie de Bézier para los parámetros u y v
  var res: Point
  res.x = 0.0
  res.y = 0.0
  let n = len(controlPoints) - 1
  let m = len(controlPoints[0]) - 1

  for i in 0..n:
    for j in 0..m:
      let bi = Bernstein(i, n, u)
      let bj = Bernstein(j, m, v)
      res.x += bi * bj * controlPoints[i][j].x
      res.y += bi * bj * controlPoints[i][j].y

  return res

# Definir la cuadrícula de puntos
let rows = 10
let cols = 10

# Ejemplo de uso:
let controlPoints: ControlPoints = @[
  @[(0.0, 0.0), (1.0, 0.0), (2.0, 0.0)],
  @[(0.0, 1.0), (1.0, 1.0), (2.0, 1.0)],
  @[(0.0, 2.0), (1.0, 2.0), (2.0, 2.0)]
]

for i in 0..rows:
  for j in 0..cols:
    let u = i.float / rows.float
    let v = j.float / cols.float
    let pointOnSurface = BezierSurface(u, v, controlPoints)
    echo "Punto en la superficie de Bezier para u =", u, " y v =", v, ": ", pointOnSurface
