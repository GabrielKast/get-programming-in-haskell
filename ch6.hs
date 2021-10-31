import Data.List

teams = ["red", "yellow", "orange", "blue", "purple"]

subseq s e xs = reverse (take e (reverse (drop s xs)))

inFirstHalf e xs=elem e firstHalf
  where l=length xs
        firstHalf = take (l `div` 2) xs

