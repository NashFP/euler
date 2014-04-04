// Euler Problem 10: Summation of primes

let isPrime x =
    { 2 .. x |> float |> sqrt |> int }
    |> Seq.forall (fun d -> x % d <> 0)

let sumOfPrimes =
    Seq.initInfinite((+) 2)
    |> Seq.takeWhile (fun x -> x < 2000000)
    |> Seq.filter isPrime
    |> Seq.sumBy (fun x -> bigint x)
