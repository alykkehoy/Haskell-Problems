--find the largetst element of a list
largest :: Ord a => [a] -> a
largest [] = undefined
largest (x:xs)
  | null xs = x
  | x > x` = x
  | otherwise = x`
  where
    x` = largest xs

numFromDigits ::[Int] ->Int
numFromDigits [] = 0
numFromDigits (d:ds) = d * 10^n + numFromDigits ds
  where
    n = length (d:ds) - 1

numFromDigits2 :: [Int] -> Int
numFromDigits2 [] = 0
numFromDigits2 ds = numFromDigits2` (reverse ds)
  where
    numFromDigits2` [] = 0
    numFromDigits2` (d:ds) = d + 10 * numFromDigits2 ds
