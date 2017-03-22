import Control.Monad

findRoom :: [Int] -> Int -> String
findRoom rooms n
  | n `elem` rooms = findRoom rooms (n + 1)
  | otherwise = show n

bookRoom :: Int -> Int -> [Int] -> String
bookRoom r n rooms
  | r == n = "too late"
  | otherwise = findRoom rooms 1

main = do
  x <- getLine
  nums <- return(map read (words x))
  r <- return(head nums)
  n <- return(last nums)
  rooms <- replicateM n readLn
  putStrLn(bookRoom r n rooms)
  return()
