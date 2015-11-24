defmodule Euler20.Worker do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def sum_factorial(number) do
    GenServer.call(__MODULE__, {:sum_factorial, number})
  end

  def handle_call({:sum_factorial, number}, _from, state) do
    {:reply, number |> do_factorial |> do_sum, state}
  end

  defp do_factorial(number, acc \\ 1) do
    cond do
      number == 0 -> acc
      true -> do_factorial(number - 1, acc * number)
    end
  end

  defp do_sum(number, acc \\ 0) do
    cond do
      number == 0 -> acc
      true -> do_sum(div(number, 10), acc + rem(number, 10))
    end
  end
end
