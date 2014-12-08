def solve(max: Int): Int = {
  1.to(max).filter { n => n % 3 == 0 || n % 5 == 0 }
    .foldLeft(0) { (sum, n) => sum + n }
}

val answer = solve(1000)
println("Answer is: " + answer)
