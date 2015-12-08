//: ## [Problem 1 - Multiples of 3 and 5](https://projecteuler.net/problem=1)
//:
//: If we list all the natural numbers below 10 that are multiples of 3 or 5,
//: we get 3, 5, 6 and 9. The sum of these multiples is 23.
//:
//: Find the sum of all the multiples of 3 or 5 below 1000.
//:
//: **Solution:** 233168

let rangeOfNumbers = 0..<1000
let solution = rangeOfNumbers
    .filter({ x in (x % 3 == 0) || (x % 5 == 0) })
    .reduce(0, combine: { sum, x in sum + x })

print(solution) // 233168
