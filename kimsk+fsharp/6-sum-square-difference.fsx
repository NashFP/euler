let square x = x * x

let rec sumOfSquare x =
    match x with
    | 0 -> 0
    | x -> square x + sumOfSquare (x - 1)

let squareOfSum x = [1..x] |> Seq.sum |> square

squareOfSum 100 - sumOfSquare 100