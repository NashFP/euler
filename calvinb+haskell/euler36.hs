import Numeric
import Data.Char

toStringBase :: Int -> Int -> String
toStringBase n b = showIntAtBase b intToDigit n ""

isPal :: String -> Bool
isPal s = s == reverse s

isDoublePal :: Int -> Bool
isDoublePal n = all isPal $ map (\b -> toStringBase n b) [2, 10]

doublePals :: [Int]
doublePals = filter isDoublePal [1..]

main = print $ sum $ takeWhile (<1000000) doublePals
