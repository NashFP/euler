#!/usr/env elixir

defmodule Euler26 do
  def solve do
    {i, _} = (for n <- 1..1000, do: {n, cycle_length(1, n, [])})
    |> Enum.max_by(fn({_, c}) -> c end)
    i
  end

  # Find cycle length via long division,
  # measuring distance between equal remainders.
  defp cycle_length(numer, denom, remainders) do
    product = 0..9
    |> Enum.map(&(&1 * denom))
    |> Enum.take_while(&(&1 <= numer))
    |> List.last

    case numer - product do
      0         -> 0 # terminates; no cycle
      remainder ->
        case Enum.find_index(remainders, &(&1 === remainder)) do
          nil   -> cycle_length(remainder * 10, denom, [remainder|remainders])
          index -> index + 1
        end
    end
  end
end

IO.puts Euler26.solve
