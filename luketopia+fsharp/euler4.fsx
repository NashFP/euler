// Euluer Problem 4: Largest palindrome product

let largestPalindrome =
    query { 
        let nums = { 100 .. 999 }
        for x in nums do
        for y in nums do
        select (x * y) into product
        let digits = product |> string |> List.ofSeq
        where (digits = List.rev digits)
        maxBy product 
    }
