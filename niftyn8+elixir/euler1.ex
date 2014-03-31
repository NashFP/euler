defmodule Euler1 do
  def solve(num) do
    0..num
    |> Enum.filter( &(rem(&1, 3) == 0 || rem(&1, 5) == 0 ) )
    |> :lists.sum
  end
end

IO.puts("Answer is: #{Euler1.solve(1000)}")
