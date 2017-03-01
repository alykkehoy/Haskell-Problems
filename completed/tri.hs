findEq :: [Int] -> String
findEq (a:b:c:x)
  | a + b == c = show a ++ "+" ++ show b ++ "=" ++ show c
  | a - b == c = show a ++ "-" ++ show b ++ "=" ++ show c
  | a * b == c = show a ++ "*" ++ show b ++ "=" ++ show c
  | a `div` b == c = show a ++ "/" ++ show b ++ "=" ++ show c
  | a == b + c = show a ++ "=" ++ show b ++ "+" ++ show c
  | a == b - c = show a ++ "=" ++ show b ++ "-" ++ show c
  | a == b * c = show a ++ "=" ++ show b ++ "*" ++ show c
  | a == b `div` c = show a ++ "=" ++ show b ++ "/" ++ show c
  | otherwise = ""

main = do
  x <- getLine
  putStrLn( findEq ( map read ( words x ) ) )
