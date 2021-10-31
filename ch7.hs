import Data.List

-- mytake n xs = reverse (do_take xs n)
-- do_take _ 0 = []
-- do_take (x:rest) i = x:(do_take rest) i-1

myTake 0 _ = []
myTake n (x:xs) = [x] ++ myTake (n-1) xs


myGCD a b = if remainder == 0
            then b
            else myGCD b remainder
  where remainder = a `mod` b


sayAmount 1 = "one"
sayAmount 2 = "two"
sayAmount _ = "a bunch"
