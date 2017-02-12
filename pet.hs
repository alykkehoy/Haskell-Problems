getScores :: Int -> IO [[Int]]
getScores 0 = return []
getScores n = do
  x <- getLine
  --line <- map ( read ( words x ) )
  line2 <- getScores ( n - 1 )
  return ((map read ( words x ) ) : line2)

calcScores :: [[Int]] -> [Int]
calcScores [] = []
calcScores (x:xs) = ( sum x : calcScores xs )

findWinner :: [Int]-> Int -> String
findWinner (x : []) n = show n ++ " " ++ show x
findWinner (x:xs) n
  | x >= maximum xs = show n ++ " " ++ show x
  | otherwise = findWinner xs (n + 1)

main = do
  scores <- getScores 5
  sums <- return ( calcScores scores )
  putStrLn ( findWinner sums 1 )
