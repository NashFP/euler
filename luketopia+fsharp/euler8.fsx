// Euler Problem 8: Largest product in a series

open System
open System.IO

let largestProduct =
    File.ReadAllText (__SOURCE_DIRECTORY__ + "/euler8.txt")
    |> Seq.filter Char.IsDigit
    |> Seq.map (string >> int)
    |> Seq.windowed 5
    |> Seq.map (Seq.reduce (*))
    |> Seq.max
