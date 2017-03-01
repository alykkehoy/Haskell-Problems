getCals :: Int -> IO [String]
getCals 0 = return []
getCals n = do
  cal <- getLine
  cal2 <- getCals ( n - 1 )
  return (cal : cal2)

calc :: Int -> Int
calc n =
  if n `mod` 400 == 0
     then n `div` 400
     else n `div` 400 + 1

findNeeded  :: [Int] -> IO ()
findNeeded [] = return ()
findNeeded (x:xs) = do
  print ( calc ( x ) )
  findNeeded xs

main = do
  n <- readLn
  cals <- getCals n
  findNeeded ( map read cals )
  return ()
