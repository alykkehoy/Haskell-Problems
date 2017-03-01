sumDigits :: Int -> Int
sumDigits 0 = 0
sumDigits n = n `mod` 10 + sumDigits ( n `div` 10 )

findN :: Int -> Int -> Int
findN x n
  |  x == sumDigits n = n
  | otherwise = findN x ( n + 1 )

findM :: Int -> Int -> Int
findM x m
  |  x == sumDigits m = m
  | otherwise = findM x ( m - 1 )

main = do
  l <- readLn
  d <- readLn
  x <- readLn
  print ( findN x l )
  print ( findM x d )
