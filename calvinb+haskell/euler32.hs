import Data.List

size = 9
perms = permutations $ take size $ "123456789"
range = [1..size - 2]

sliceSizes = nub [(x,y,z) | x <- range, y <- range, z <- range, 
    x <= y, y <= z, x + y + z == size]

triple p x y = map read [take x p, take y $ drop x p, drop (x + y) p] :: [Integer]

triples = [triple p x y | p <- perms, (x,y,_) <- sliceSizes, x < y]
pans = [(x,y,z) | [x,y,z] <- triples, x * y == z]
sums = nub [s | (_,_,s) <- pans]

main = do
    print $ sum sums
