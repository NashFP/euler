-- Euler #33
-- Discover all fractions with an unorthodox cancelling method.
--
-- We're looking for three non-zero digits a, b, and c for which
-- a/b < 1 and a/b = (10a + c) / (10c + b)

import Data.Ratio

digits = [(a,b,c) | a <- [1..9], b <- [1..9], c <- [1..9]] 

fractions = [a % b | (a,b,c) <- digits, a % b == (10*a + c) % (10*c + b), a % b < 1]

answer = denominator $ product fractions

main = print answer
