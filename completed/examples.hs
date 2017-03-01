import Prelude hiding (length, (++))

length :: [a] -> Int
length xs = if null xs then 0 else 1 + length (tail xs)

length' [] = 0
length' (_:xs) = 1 + length' xs

length'' xs | null xs = 0
            | otherwise = 1 + length'' (tail xs)

length''' xs = case xs of [] -> 0
                          (_:xs) -> 1 + length''' xs

power :: (Num a, Integral b) => a -> b -> a
power b p = if p == 0 then 1
            else  b * power b (p - 1)

power' b 0 = 1
power' b p = b * power' b (p - 1)

power'' b p | p == 0 = 0
            | otherwise = b * power'' b (p - 1)
