// Euler Problem 2: Even Fibonacci numbers

let fibs = 
    (1, 1) 
    |> Seq.unfold (fun (x1, x2) -> 
        let x3 = x1 + x2 
        Some (x3, (x2, x3)))
    |> Seq.append [1; 1]

let evenFibsSum = 
    fibs
    |> Seq.takeWhile (fun x -> x < 4000000)
    |> Seq.filter (fun x -> x % 2 = 0)
    |> Seq.sum
