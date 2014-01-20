// I thought the most intuitive way to solve this problem would be to generate the
// sequence of digits and then find the particular digits of interest, but since we
// would need 1,000,000 members, it would take forever. So we need to be able to
// calculate a particular digit of the sequence.

// To find the digit at a particular ordinal position, we need to know which
// natural number is it a part of (which we will call target), and which digit
// of that number. By which digit, we mean which power of 10.

// Finding the target is interesting since the number of digits keeps changing as we go up.
// Let's call the position at which the digit count goes up, a bump.
// The first bumps are 10 and 190. We might also count 1.

// The 1st 1-digit number is at position 1.
// The 1st 2-digit number is at position 10.
// The 1st 3-digit number is at position 190.

// Once we have the target natural number, which place we want is determined by the
// difference between the input and the most recent bump.

// Find the position of the first digit of the first natural number of the given
// number of digits.
let rec bump = function
    | 1 -> 1
    | digits -> bump (digits - 1) + 9 * (digits - 1) * (pown 10 (digits - 2))

// Find the number of digits of the target number and the position at which that
// number of digits begins.
let bumpFloor n =
    let rec bumpFloor' digits index =
        let digits' = digits + 1
        let nextBump = bump digits'
        if nextBump > n then (digits, index)
        else bumpFloor' digits' nextBump

    bumpFloor' 1 1

// Find the target natural number at the given position.
let target index =
    let (digits, bumpIndex) = bumpFloor index
    (index - bumpIndex) / digits + (pown 10 (digits - 1))

// Find the particular digit of the specified number.
let digitFromRight number place =
    number % (pown 10 (place + 1)) / (pown 10 place)
   
// Find the digit at the given position n.
let digit n =
   let (digits, index) = bumpFloor n
   let targetNumber = target n
   let indexFromLeft = (n - index) % digits
   digitFromRight targetNumber (digits - 1 - indexFromLeft)

 let result =
   (digit 1) * (digit 10) * (digit 100) * (digit 1000) * (digit 10000) * (digit 100000) * (digit 1000000)
 
