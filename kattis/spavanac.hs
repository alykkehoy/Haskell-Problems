calc :: [Int] -> String
calc (hour:min:xxs)
  | newMin < min = show hour ++ " " ++ show newMin
  | otherwise = show newHour ++ " " ++ show newMin
  where
    newMin = (min - 45) `mod` 60;
    newHour = (hour - 1) `mod` 24;

main = do
  time <- getLine
  putStrLn ( calc ( map read ( words time ) ) )
