sumDigits :: Int -> Int
sumDigits 0 = 0
sumDigits n = n `mod` 10 + sumDigits ( n `div` 10 )

findP :: Int -> Int -> Int
findP n p
  | sumDigits n == sumDigits (n * p) = p
  | otherwise =  findP n ( p + 1 )

main = do
  n <- readLn
  if n /= 0
     then do
       print ( findP n 11 )
       main
       else return ()
