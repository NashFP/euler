// Euler Problem 5: Smallest multiple

let smallestMultiple =  
    let factors = [| 11 .. 20 |]
    Seq.initInfinite ((+) 1)
    |> Seq.find(fun x -> 
        factors |> Array.forall (fun n -> x % n = 0))
