proc horner(u: float64, a:seq[float64]): float64 =
  var c: float64 = a[a.len()-1]
  echo "c[2]=",c,"\n"
  for i in 1..a.len-1:
    c = a[a.len-1-i]+c*u
    echo "c[",a.len-1-i,"]=",c,"\n"
  result=c
 
var a: seq[float64] = @[1.0,2.0,2.0,-3,-3.0,4.0,-10.0,4.1,-10.0]
var u: float64 = 0.5
echo horner(u,a),",",a.len()