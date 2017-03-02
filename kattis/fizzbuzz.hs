getInput :: String -> [Int]
getInput s = map  read ( words s )

fizzbuzz :: Int -> Int -> Int -> String
fizzbuzz a b c = if c `mod` a == 0 && c `mod ` b == 0
                    then "FizzBuzz"
                    else if c `mod` a == 0
                    then "Fizz"
                    else if c `mod` b == 0
                    then "Buzz"
                    else show c

parse :: [Int] -> Int -> IO ()
parse (x:xs:xxs:xxxs) n = do
  if n <= xxs
     then do
       putStrLn( fizzbuzz x xs n )
       parse ( x : xs : xxs : xxxs ) ( n + 1)
     else return ()


main :: IO()
main = do
  n <- getLine
  --s <- getInput n
  parse ( map read ( words n ) ) 1
  --parse [2, 3, 7] 1
