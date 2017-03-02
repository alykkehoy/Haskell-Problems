getEntry :: String -> [Int]
getEntry s = map read(words s)

fix :: [(Int, Int)] -> Int -> [(Int, Int)]
fix ((a, b):[]) n = [(a, b - n)]
fix ((a, b):xs) n = [(a, b - n)] ++ fix xs n

convert :: [(Int, Int)] -> Int
convert ((a, b):[]) = a * b
convert ((a, b):(c, d):xs) = a * b + convert ( fix ((c, d) : xs) b )

getEntries :: Int -> IO [[Int]]
getEntries 0 = return []
getEntries n = do
  s <- getLine
  ss <- return ( getEntry s )
  s2 <- getEntries (n - 1)
  return (ss : s2)

makeLog :: [[Int]] -> [(Int, Int)]
makeLog [] = []
makeLog (s:xs) = (ent : ent2)
  where
    ent = ( head s, head ( tail s ) )
    ent2 = makeLog xs


main = do
  n <- readLn
  if n /= (-1)
     then do
       log <- getEntries n
       putStrLn ( show ( convert ( makeLog log ) ) ++ " miles")
       main
       else return ()
