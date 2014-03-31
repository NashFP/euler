defmodule Euler1P do
  def solve(num) do
    solver(:lists.seq(1, num), 0)
  end

  def solver([], acc), do: IO.puts acc
  def solver([h|t], acc) do
    case rem(h, 3) == 0 || rem(h, 5) == 0 do
      true -> spawn(__MODULE__, :solver, [t, acc + h])
      _ -> spawn(__MODULE__, :solver, [t, acc])
    end
  end
end

Euler1P.solve(1000)
