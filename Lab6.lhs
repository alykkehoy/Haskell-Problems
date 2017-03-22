Lab 6 - Scans Exercises

> fibsN x = fibs !! x

1. Modify your fibs function to only return the first 20 Fibonacci
numbers.

> fibs = 1 : scanl (+) 1 (take 18 fibs)

2. Modify fibs to return the Fibonacci numbers that are less than
100.

> fibs2 = 1 : takeWhile (< 100) (scanl (+) 1 fibs)

3. Try to write the factorial function from Recursion as a scan.
You’ll want scanl again, and your start value will be 1. Warning:
this will also generate an infinite list, so you may want to pass it
through a take function or similar.

> fact = scanl (*) 1 (take 9 [1..])

> fibonacci :: Integral a => a -> a
> fibonacci 0 = 0
> fibonacci 1 = 1
> fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)
