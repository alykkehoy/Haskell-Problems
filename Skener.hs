import Control.Monad (replicateM)

readMatrix :: [Int] -> IO[String]
readMatrix xs = replicateM (head xs) getLine

convertHeight :: [String] -> Int -> [String]
convertHeight [] _ = []
convertHeight (x:xs) n = (replicateM n x) ++ (convertHeight xs n)

convertWidth :: [String] -> Int -> [String]
convertWidth [] _ = []
convertWidth (x:xs) n = (convertChars x n):(convertWidth xs)

convertChars :: String -> Int -> String
convertChars [] _ = []
convertChars (c:cs) n = (replicateM n x) ++ (convertChars cs n)

convertMatrix :: [String] -> [Int] -> [String]
convertMatrix s (r:c:zr:zc:x) = convertWidth newS zr
  where
    newS = convertHeight s zr

main :: IO()
main = do
  s <- getLine
  x <- return(map read (words s))
  matrix <- readMatrix x
  print(convertMatrix matrix x)
