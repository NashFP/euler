// Euler Problem 7: 10001st prime

let isPrime x =
    { 2 .. x |> float |> sqrt |> int }
    |> Seq.forall (fun d -> x % d <> 0)

let prime1001 =
    Seq.initInfinite ((+) 2)
    |> Seq.filter isPrime
    |> Seq.nth 10000
