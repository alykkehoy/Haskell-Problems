getNums :: String -> [Int]
getNums s = map read ( words s )

getNames :: Int -> IO [String]
getNames 0 = return []
getNames n = do
  s <- getLine
  ss <- getNames ( n - 1 )
  return ( s : ss )

getCarrots :: [Int] -> IO ()
getCarrots [] = return ()
getCarrots (x:xs:xxs) = do
  getNames x
  print xs

main = do
  s <- getLine
  --nums <- getNums s
  getCarrots ( map read ( words s ) )
