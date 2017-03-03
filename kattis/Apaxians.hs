
removeReptes :: String -> String
removeReptes [] = []
removeReptes (x:xs) = x : removeReptes newXs
  where
    newXs = dropWhile (== x) xs

main = do
  name <- getLine
  putStrLn(removeReptes name)
