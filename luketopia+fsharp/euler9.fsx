// Euler Problem 9: Special Pythagorean triplet

let triplet =
    query { 
        for c in Seq.initInfinite ((+) 1) do
        for b in 1 .. c - 1 do
        for a in 1 .. b - 1 do
        where (a + b + c = 1000)
        where (a * a + b * b = c * c)
        select (a * b * c)
        head
    }
