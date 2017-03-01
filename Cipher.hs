module Cipher where

import Data.Char

shiftChar :: Char -> Int -> Char
shiftChar c shift
  | isUpper c && newChar > fromEnum('Z') = toEnum(newChar - 26)
  | newChar > fromEnum('z') = toEnum(newChar - 26)
  | otherwise = toEnum(newChar)
  where
    newChar = fromEnum c + shift

toCaesar :: String -> Int -> String
toCaesar [] _ = []
toCaesar (x:xs) shift = newChar : toCaesar xs shift
  where
    newChar = shiftChar x shift

unCaesar :: String -> Int -> String
unCaesar xs shift = toCaesar xs (26 - shift)
