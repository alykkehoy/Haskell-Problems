import Control.Monad

printOutput :: Int -> IO()
printOutput num
  | num `mod` 2 == 0 = putStrLn(show num ++ " is even")
  | otherwise = putStrLn(show num ++ " is odd")

main = do
  n <- readLn
  nums <- replicateM n readLn
  mapM printOutput nums
