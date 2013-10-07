module Lab6

where
import Data.List
import System.Random
import Week6

carmichael :: [Integer]
carmichael = [ (6*k+1)*(12*k+1)*(18*k+1) | 
      k <- [2..], 
      isPrime (6*k+1), 
      isPrime (12*k+1), 
      isPrime (18*k+1) ]


-- 1. Implement a function
-- exM :: Integer -> Integer -> Integer -> Integer
-- that does modular exponentiation of x^y in polynomial time, by repeatedly squaring modulo N.

-- Duration: 45 minutes.

exM2 :: Integer -> Integer -> Integer -> Integer
exM2 x y n | y == 0 = 1
           | odd y = mod (x * z^2) n
           | otherwise =  mod (z^2) n
           where z = exM2 x (div y 2) n

-- 2. Check that your implementation is more efficient than expM by running a number
-- of relevant tests and documenting the results.

-- We have tested the functions by adding 2^10, 2^20 and 2^30 to both functions as x and y (First and second parameter) with a module of 5 (Third parameter).
-- The execution times needed are documented below. As we can see the new function (exM2) is much faster than the old implementation (expM). How bigger the exponent
-- the bigger the difference will be between the two implementations.

-- Duration: 45 minutes mostly waiting for the tests to be finished.

-- *Lab6> expM (2^10) (2^10) 5
-- 1
-- (0.01 secs, 3640608 bytes)
-- *Lab6> exM2 (2^10) (2^10) 5
-- 1
-- (0.01 secs, 3604736 bytes)

-- *Lab6> expM (2^20) (2^20) 5
-- 1
-- (0.14 secs, 31467784 bytes)
-- *Lab6> exM2 (2^20) (2^20) 5
-- 1
-- (0.01 secs, 3093688 bytes)

-- *Lab6> expM (2^30) (2^30) 5
-- 1
-- (428.97 secs, 51767864320 bytes)
-- *Lab6> exM2 (2^30) (2^30) 5
-- 1
-- (0.01 secs, 3638456 bytes)

-- *Lab6> exM2 (2^1000000) (2^1000000) 5
-- 1
-- (77.08 secs, 109128555280 bytes)

-- 3. In order to test Fermat’s Primality Check (as implemented in function primeF), the list of prime numbers generated by 
-- Eratosthenes’ sieve is useless, for Fermat’s Primality Check correctly classify the primes as primes. Where the check can 
-- go wrong is on classifying composite numbers; these can slip through the Fermat test.
-- Write a function composites :: [Integer] that generates the infinite list of composite natural numbers. Hint: modify 
-- Eratosthenes’ sieve, so that instead of throw- ing away composite numbers, it marks them as false. Next filter out 
-- the numbers marked as false.

-- Duration: 45 minutes.

-- Return a infinite list with composite numbers.
composites :: [Integer]
composites = composite_sieve [2..]

-- Get all composite number from an inputted integer list.
composite_sieve :: [Integer] -> [Integer]
composite_sieve [] = []
composite_sieve (n:ns) = if not (isPrime n) 
	                     then n : cs 
	                     else cs 
	                     where cs = composite_sieve (filter (\ m -> isPrime m == False) ns)

-- 4. Use the list of composite numbers to test Fermat's primality check. What is the
-- least composite number that you can find that fools the check, for testF k with
-- k = 1; 2; 3 ? What happens if you increase k?







