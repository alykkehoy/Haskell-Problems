import Control.Monad

powSum :: [String] -> Int
powSum [] = 0
powSum (x:xs) = (n ^ p) + powSum xs
  where
    p = read ((last x) : [])
    n = read (init x)

main :: IO()
main = do
  n <- readLn
  nums <- replicateM n getLine
  print (powSum nums)
