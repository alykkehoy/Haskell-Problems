amove :: Int -> Int
amove pos
  | pos == 1 = 2
  | pos == 2 = 1
  | otherwise = pos

bmove :: Int -> Int
bmove pos
  | pos == 2 = 3
  | pos == 3 = 2
  | otherwise = pos

cmove :: Int -> Int
cmove pos
  | pos == 1 = 3
  | pos == 3 = 1
  | otherwise = pos

track :: [Char] -> Int -> Int
track [] pos = pos
track (m:ms) pos
  | m == 'A' = track ms (amove pos)
  | m == 'B' = track ms (bmove pos)
  | m == 'C' = track ms (cmove pos)

main :: IO()
main = do
  moves <- getLine
  print (track moves 1)
