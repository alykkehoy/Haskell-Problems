main = do
  input <- readLn
  if mod (input :: Int) 2 == 0
     then putStrLn("Bob")
     else putStrLn("Alice")
