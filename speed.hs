getEntry :: String -> [Int]
getEntry s = map read(words s)

fix :: [(Int, Int)] -> Int -> [(Int, Int)]
fix ((a, b):[]) n = [(a, b - n)]
fix ((a, b):xs) n = [(a, b - n)] ++ fix xs n

--[(speed, total time)]
--convert [(20, 2), (30, 6), (10, 7)] sould be 170
convert :: [(Int, Int)] -> Int
convert ((a, b):[]) = a * b
convert ((a, b):(c, d):xs) = a * b + convert ( fix ((c, d) : xs) b )

getEntries :: Int -> [[Int]]
getEntries 0 = return []
getEntries n = do
  s <- getLine
  ss <- getEntry s
  s2 <- getEntries (n - 1)
  return (ss : s2)

makeLog :: [[Int]] -> [(Int, Int)]
makeLog [] = []
makeLog (s:xs) = do
  ent <- ( head s, head ( tail s ) )
  ent2 <- makeLog xs
  return (ent : ent2)


main = do
  n <- readLn
  log <- return ( getEntries n )
  print ( convert ( makeLog log ) )
  --print(convert [(20,2),(30,6),(10,7)])
