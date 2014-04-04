// Euler Problem 6: Sum square difference

let inline square x = x * x

let difference = 
    let nums = {1I .. 100I}
    let sumOfSquares = (nums |> Seq.map square |> Seq.sum)
    let squareOfSum =  (nums |> Seq.sum |> square)
    squareOfSum - sumOfSquares
