makeSet :: [Int] -> [Int] -> [Int]
makeSet [] [] = [];
makeSet (x:xs) (y:ys) = ( n : m )
  where
    n = y - x
    m = makeSet xs ys

makeSetString :: [Int] -> String
makeSetString [] = ""
makeSetString (x:xs) = ( show x ) ++ " " ++ ( makeSetString xs )

main = do
  s <- getLine
  -- s :: STring
  -- words s :: [String]
  -- map :: (a -> b) -> [a] -> [b]
  -- map read (words s) :: [Int]
  -- return (map read (words s)) :: IO [Int]
  x <- return (map read ( words s ))
  set <- return(makeSet x [1, 1, 2, 2, 2, 8])
  putStrLn ( makeSetString set )
