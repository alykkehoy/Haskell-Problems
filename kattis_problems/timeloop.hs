castSpell :: (Int, Int) -> IO ()
castSpell (n , 0) = return()
castSpell (n, x) = do
  putStrLn  (show (n - x + 1) ++ " Abracadabra")
  castSpell (n, x - 1)

main = do
  input <- readLn
  castSpell ((input :: Int), (input :: Int))
