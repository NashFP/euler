// Euler Problem 1: Multiples of 3 and 5

let sum = 
    {1 .. 999}
    |> Seq.filter (fun x -> x % 3 = 0 || x % 5 = 0)
    |> Seq.sum
