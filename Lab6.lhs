# Lab 6 - Scans Exercises

> fibs = 1 : scanl (+) 1 fibs

> fibsN x = fibs !! x

1. Modify your fibs function to only return the first 20 Fibonacci
numbers.

2. Modify fibs to return the Fibonacci numbers that are less than
100.

3. Try to write the factorial function from Recursion as a scan.
You’ll want scanl again, and your start value will be 1. Warning:
this will also generate an infinite list, so you may want to pass it
through a take function or similar.

> fibonacci :: Integral a => a -> a
> fibonacci 0 = 0
> fibonacci 1 = 1
> fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

