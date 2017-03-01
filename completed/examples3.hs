

data [] a = [] | a : [a]

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

--takeWhile ::
