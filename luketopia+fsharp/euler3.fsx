// Euler Problem 3: Largest prime factor

let smallestFactor x =
    { 2I .. x }
    |> Seq.tryFind (fun f -> x % f = 0I)

let largestPrimeFactor =
    600851475143I
    |> Seq.unfold (fun x -> 
        smallestFactor x 
        |> Option.map (fun f -> f, x / f))
    |> Seq.max
