import Prelude hiding (map, head, tail, init, last, take, drop, takeWhile, dropWhile, words)

--data [] a = [] | a : [a]

head :: [a] -> a
head (x:_) = x

tail :: [a] -> [a]
tail (_:xs) = xs

init :: [a] -> [a]
init (x:[]) = []
init (x:xs) = x : (init xs)

last :: [a] -> a
last (x:[]) = x
last (x:xs) = last xs

take :: Int -> [a] -> [a]
take 0 _ = []
take _ [] = []
take n (x:xs) = x : (take (n - 1) xs)

drop :: Int -> [a] -> [a]
drop 0 xs = xs
drop _ [] = []
drop n (x:xs) = drop (n - 1) xs

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile test [] = []
takeWhile test (x:xs)
  | test x = x : takeWhile test xs
  | otherwise = []

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile test [] = []
dropWhile test (x:xs)
  | test x = dropWhile test xs
  | otherwise =  x : xs

words :: String -> [String]
words "" = []
words x
  | otherWords == [] = [word]
  | otherwise = word : words (tail otherWords)
  where
    word = takeWhile (/= ' ') x
    otherWords = dropWhile (/=' ') x

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map func (x:xs) = func x : map func xs
