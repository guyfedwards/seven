fib := method(n, if(n <= 1, return 1, return fib(n - 1) + fib(n - 2)))

fib(10) println

fib2 := method(n,
  j := 0
  k := 1
  for(i, 0, n,
    temp := k
    k = j + k
    j = temp
  )
  return j
)

fib2(10) println
