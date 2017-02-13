import Data.Char

convert :: Char -> String
convert 'a' = "@"
convert 'b' = "8"
convert 'c' = "("
convert 'd' = "|)"
convert 'e' = "3"
convert 'f' = "#"
convert 'g' = "6"
convert 'h' = "[-]"
convert 'i' = "|"
convert 'j' = "_|"
convert 'k' = "|<"
convert 'l' = "1"
convert 'm' = "[]\\/[]"
convert 'n' = "[]\\[]"
convert 'o' = "0"
convert 'p' = "|D"
convert 'q' = "(,)"
convert 'r' = "|Z"
convert 's' = "$"
convert 't' = "']['"
convert 'u' = "|_|"
convert 'v' = "\\/"
convert 'w' = "\\/\\/"
convert 'x' = "}{"
convert 'y' = "`/"
convert 'z' = "2"
convert n = [n]

newAlphabet :: String -> String
newAlphabet [] = []
newAlphabet (x:xs) = convert (toLower x) ++ newAlphabet xs

main = do
  line <- getLine
  putStrLn (newAlphabet line)
