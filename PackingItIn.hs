import Control.Monad (replicateM)

type Order = (Int, Int, Int, Int)

readOrder :: String -> Order
readOrder s = (b,e,t,m)
  where
    [b,e,t,m] = map read (words s)

printOrders :: [Order] -> IO()
printOrders [] = return ()
printOrders (o:os) = do
  orderToBoxes o
  printOrders os

orderToBoxes :: Order -> IO()
orderToBoxes (b, e, t, m)
  | b < numBoxes = putStrLn "Need more boxes"
  | otherwise = putStrLn ("Pack " ++ (show numBoxes) ++ " boxes")
  where
    numBoxes = fillBoxes 20 e t m

fillBoxes :: Int -> Int -> Int -> Int -> Int
fillBoxes _ 0 0 0 = 1
fillBoxes s e t m
  | s - 6 >= 0 && e > 0 = fillBoxes (s - 6) (e - 1) t m
  | s - 3 >= 0 && t > 0 = fillBoxes (s - 3) e (t - 1) m
  | s - 1 >= 0 && m > 0 = fillBoxes (s - 1) e t (m - 1)
  | otherwise = 1 + fillBoxes 20 e t m

main :: IO()
main = do
  n <- readLn
  orders <- replicateM n (fmap readOrder getLine)
  printOrders orders
