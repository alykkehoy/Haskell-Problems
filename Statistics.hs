printStatistics :: [Int] -> Int -> String
printStatistics ns n = "Case " ++ show n ++  ": " ++ show min1 ++ " " ++ show max1 ++ " " ++ show range
    where
      min1 = minimum ns
      max1 = maximum ns
      range = max1 - min1

getStats :: Int -> IO()
getStats n = do
  x <- getLine
  nums <- return(map read (words x))
  putStrLn(printStatistics (tail nums) n)
  getStats (n + 1)

main = do
  getStats 1
