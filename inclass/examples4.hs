sum1 :: [Int] -> Int
sum1 [] = 0
sum1 (x:xs) = x + sum1 xs

sum1' :: [Int] -> Int
sum1' xs = foldr (+) 0 xs

prod :: [Int] -> Int
prod xs = foldr (*) 1 xs

totalLength :: [String] -> Int
totalLength xs = foldr (\w x -> length w + x) 0 xs

totalLength' :: [String] -> Int
totalLength' xs = foldl (\w x -> length w + x) 0 xs

main =
    return()
