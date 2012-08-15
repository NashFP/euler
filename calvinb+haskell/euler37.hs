import Data.List

oneMorePrime :: [Int] -> [Int]
oneMorePrime [] = [2]
oneMorePrime (p:ps) = (nextP:p:ps)
    where   nextP = head $ dropWhile hasFactor [p+1..]
            hasFactor cand = any (\f -> cand `mod` f == 0) (p:ps)

dropLR :: Int -> [Int]
dropLR n = map read $ init $ tail $ tails $ show n

dropRL :: Int -> [Int]
dropRL n = map read $ init $ tail $ inits $ show n

trims :: Int -> [Int]
trims n = (dropLR n) ++ (dropRL n)

findAnswer :: Int -> [Int]
findAnswer count = findAnswer' count [] []
    where   findAnswer' 0 primes result = result
            findAnswer' count [] result = findAnswer' count (oneMorePrime []) result
            findAnswer' count (p:ps) result =
                if p < 10
                then findAnswer' count (oneMorePrime (p:ps)) result
                else if all (\x -> x `elem` ps) (trims p)
                     then findAnswer' (count-1) (oneMorePrime (p:ps)) (p:result)
                     else findAnswer' count (oneMorePrime (p:ps)) result

main = print $ findAnswer 11
