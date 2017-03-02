import Control.Monad

printOutput :: Int -> IO()
printOutput num
  | num `mod` 2 == 0 = putStrLn(show num ++ " is even")
  | otherwise = putStrLn(show num ++ " is odd")

printAll :: [Int] -> IO()
printAll [] = return ()
printAll (x:xs) = do
  printOutput x
  printAll xs
  return ()

main = do
  n <- readLn
  nums <- replicateM n readLn
  printAll nums

