defmodule Euler48.Worker do
  use GenServer
  require Integer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def self_powers(number, num_digits \\ 10) do
    GenServer.call(__MODULE__, {:self_powers, number, num_digits})
  end

  def handle_call({:self_powers, number, num_digits}, _from, state) do
    total = do_self_powers(number)
    {:reply, rem(total, round(:math.pow(10, num_digits))), state}
  end

  defp do_self_powers(number, acc \\ 0) do
    cond do
      number < 1 ->  acc
      number == 1 -> acc + 1
      true -> do_self_powers(number - 1, acc + pow(number, number))
    end
  end

  defp pow(_, 0), do: 1
  defp pow(x, n) when Integer.is_odd(n), do: x * pow(x, n - 1)
  defp pow(x, n) do
    result = pow(x, div(n, 2))
    result * result
  end
end
