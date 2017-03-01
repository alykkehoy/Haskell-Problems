import Data.Char

eftBool :: Bool -> Bool -> [Bool]
eftBool False True = [False, True]
eftBool Fasle False = [False]
eftBool True True = [True]
eftBool True False = []

eftChar :: Char -> Char -> [Char]
eftChar start stop
  | nstart > nstop = []
  | nstart == nstop = [start]
  | otherwise = start : eftChar (succ start) stop
  where
    nstart = fromEnum start
    nstop = fromEnum stop

filterString :: String -> String
filterString [] = []
filterString (x:xs)
  | isUpper x = x : filterString xs
  | otherwise = filterString xs

capFirst :: String -> String
capFirst [] = []
capFirst (x:xs) = toUpper x : xs

capFirst' :: String -> String
capFirst' [] = []
capFirst' (x:xs) = toUpper x : capFirst' xs

main =
  putStrLn(filterString "HbEfLrLxO")
