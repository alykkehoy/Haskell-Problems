getTemps::String -> [Int]
getTemps s = filter (<0) (map read(words s))


main = do
  n <- getLine
  temps <-getLine
  print(length (getTemps(temps)))
