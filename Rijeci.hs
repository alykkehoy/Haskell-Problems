rijeci :: [Char] -> [Char]
rijeci [] = []
rijeci (x:xs)
  | x == 'A' = 'B' : rijeci xs
  | x == 'B' = 'B' : 'A' : rijeci xs

rijecis :: [Char] -> Int -> [Char]
rijecis x  0 = x
rijecis x n = rijecis (rijeci x) (n - 1)

rijeci2 :: Int -> Int -> Int -> IO()
rijeci2 a b n
  | n > 0 = rijeci2 (b) (a + b) (n - 1)
  | otherwise = putStrLn(show a ++ " " ++ show b)

main = do
  n <- readLn
  rijeci2 1 0 n
  --xs <- return(rijecis "A" n)
  --as <- return(length (filter (=='A') xs))
  --bs <- return(length xs - as)
  --putStrLn(show as ++ " " ++ show bs)
