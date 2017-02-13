getNums :: Int -> IO [[Int]]
getNums 0 = return []
getNums n = do
  line <- getLine
  line2 <- getNums ( n - 1 )
  return ( ( map read ( words line ) ) : line2 )

--s1 :: Int -> Int
--s1 0 = 0
--s1 n = n + s1 (n - 1)

--s2 :: Int -> Int -> Int
--s2 0 _ = 0
--s2 n x
--  | x `mod` 2 /= 0 = x + (s2 (n - 1) (x + 1))
--  | otherwise = s2 n (x + 1)

--s2 :: Int ->[Int]
--s2 0 = []
--s2 n = (((n * 2) - 1):(s2(n - 1)))

--s3 :: Int -> [Int]
--s3 0 = []
--s3 n = ((n * 2):(s3(n - 1)))

--s3 :: Int -> Int -> Int
--s3 0 _ = 0
--s3 n x
--  | x `mod` 2 == 0 = x + (s3 (n - 1) (x + 1))
--  | otherwise = s3 n (x + 1)

printSums :: [[Int]] -> IO ()
printSums [] = return ()
printSums (x:xs) = do
  putStrLn (show (head x) ++ " " ++ show s1Num ++ " " ++ show s2Num ++ " " ++ show s3Num)
  printSums xs
    where
      n = last x
      s1Num = (n*(n + 1)) `div` 2
      s3Num = s1Num * 2
      s2Num = s3Num - n

main = do
  n <- readLn
  nums <- getNums n
  printSums nums
