findDays :: [Int] -> Int
findDays (b : k : g : xs)
  | groups == 1 = (b `div` groups) - 1
  | b `mod` groups <= 1 = b `div` groups
  | otherwise = (b `div` groups) + 1
    where
      groups = k `div` g

main = do
  x <- getLine
  nums <- return(map read (words x))
  putStrLn(show(findDays nums))
