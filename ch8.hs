-- myDrop 0 rest = rest
-- myDrop n (x:xs) = myDrop (n-1) xs

myDrop 0 rest = rest
myDrop n (x:xs) = myDrop (n-1) xs

collatz 1 = 1
collatz n = if even n
            then 1 + collatz (n `div` 2)
            else 1 + collatz (n*3 + 1)

fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fastfib n = ff 0 1 n
  where ff n2 n1 0 = n2
        ff n2 n1 i = ff n1 (n1+n2) (i-1)
