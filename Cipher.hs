module Cipher where

import Data.Char

shiftChar :: Char -> Int -> Char
shiftChar c shift
  | isUpper c && newChar > fromEnum('Z') = toEnum(newChar - 26)
  | newChar > fromEnum('z') = toEnum(newChar - 26)
  | otherwise = toEnum(newChar)
  where
    newChar = fromEnum c + shift

shiftChar2 :: Char -> Int -> Char
shiftChar2 c 0 = c
shiftChar2 'Z' shift = shiftChar2 'A' (shift - 1)
shiftChar2 'z' shift = shiftChar2 'a' (shift - 1)
shiftChar2 c shift = shiftChar2 (succ c) (shift - 1)

toCaesar :: String -> Int -> String
toCaesar [] _ = []
toCaesar (x:xs) shift = newChar : toCaesar xs shift
  where
    newChar = shiftChar2 x shift

unCaesar :: String -> Int -> String
unCaesar xs shift = toCaesar xs (26 - shift)
