import Control.Monad

readMatrix :: [Int] -> IO[String]
readMatrix xs = replicateM (head xs) getLine

convertHeight :: [String] -> Int -> [String]
convertHeight [] _ = []
convertHeight (x:xs) n = copyRows x n ++ convertHeight xs n

copyRows :: String -> Int -> [String]
copyRows _ 0 = []
copyRows x n = x : copyRows x (n - 1)

convertWidth :: [String] -> Int -> [String]
convertWidth [] _ = []
convertWidth (x:xs) n = copyChars x n : convertWidth xs n

copyChars :: String -> Int -> String
copyChars [] _ = []
copyChars (x:xs) n = (replicate n x) ++ (copyChars xs n)

convertMatrix :: [String] -> [Int] -> [String]
convertMatrix s (r:c:zr:zc:x) = convertWidth newS zc
  where
    newS = convertHeight s zr

main :: IO()
main = do
  s <- getLine
  x <- return(map read (words s))
  matrix <- readMatrix x
  (printOutput (convertMatrix matrix x))
  --mapM putStrLn (convertMatrix matrix x)

printOutput :: [String] -> IO()
printOutput [] = return ()
printOutput (x:xs) = do
  putStrLn x
  printOutput xs
