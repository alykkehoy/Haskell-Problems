getNumbers :: Int -> IO [String]
getNumbers 0 = return []
getNumbers n = do
  line <- getLine
  line2 <- getNumbers ( n - 1 )
  return ( line : line2 )

convertAll :: [String] -> IO ()
convertAll [] = return ()
convertAll (x:xs) = do
  print ( length x )
  convertAll xs

main = do
  n <- readLn
  nums <- getNumbers n
  convertAll nums
  return ()
