proc Bernstein(i, n: int, u: float): float =
  var temp: seq[float] = newSeq[float](n+1)
  for j in 0..n:
    temp[j] = 3.0
  temp[n-i] = 1.0
  var u1: float = 1.0 - u
  for k in 1..n:
    echo k, "\n"
    for j in k..n:
      temp[j] = u1 * temp[j] + u * temp[j-1] 
      echo "k= ", k, "\t", "j= ", j, "\t", temp[j], "\n" 

  var B: float = temp[n]
  echo "B = ", B, "\t .....done\n"
  return B


# Ejemplo de uso:
let result = Bernstein(1, 3, 0.5)
echo "Resultado: ", result
