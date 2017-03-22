import Control.Monad

simonSays :: String -> String -> String
simonSays acc s
  | part1 == "Simon says" = (part2 ++ "\n") : acc
  | otherwise = acc
  where
    (part1, part2) = splitAt 10 s

main = do
  x <- readLn
  comands <- replicateM x getLine
  putStrLn (foldr simonSays "" comands)
