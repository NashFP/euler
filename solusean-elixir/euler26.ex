defmodule PrimeAgent do
  @name {:global, __MODULE__}

  def start_link do
    cache = [17, 13, 11, 7, 5, 3, 2]
    Agent.start_link(fn -> cache end, name: @name)
  end

  def factor(n), do: factor(n, primes(&(&1 * &1 <= n)))
  defp factor(n, primes), do: Enum.reverse(do_factor(n, primes, 0, []))

  defp do_factor(1, [], 0, factors), do: factors
  defp do_factor(n, [], 0, factors), do: [{n, 1}|factors]
  defp do_factor(n, primes = [f|rest], o, factors) do
    cond do
      rem(n, f) == 0 -> do_factor(div(n, f), primes, o + 1, factors)
      o > 0 -> do_factor(n, rest, 0, [{f, o}|factors])
      o < 1 -> do_factor(n, rest, 0, factors)
    end
  end

  def is_prime?(n) when n < 2, do: false
  def is_prime?(n) do
    [{f, _} | _] = factor(n)
    cond do
      f == n -> true
      true -> false
    end
  end

  defp known_primes, do: Agent.get(@name, &(&1), 500000)

  def primes(func) when is_function(func), do: prime_stream |> Enum.take_while(func)
  def primes(n) when is_number(n), do: primes(&(n >= &1))

  def prime_stream do
    Stream.unfold(Enum.reverse(known_primes), fn x ->
      case x do
        [next|[]] -> get_next_primes(next)
        [next|others] -> {next, others}
        _ -> get_next_primes(x)
      end
    end)
  end

  defp n_if_prime(n) do
    cond do
      is_prime?(n) -> n
      true -> false
    end
  end

  defp async_prime_check(n), do: Task.async(fn -> n_if_prime(n) end)

  defp get_next_primes(last) do
    [head|rest] = next_primes(last)
    {head, rest}
  end

  defp next_primes(last) do
    primes = Stream.iterate(last + 2, &(&1 + 2))
    |> Enum.take(10)
    |> Enum.map(&async_prime_check/1)
    |> Enum.map(&Task.await/1)
    |> Enum.filter(&(&1))
    |> Enum.sort(&(&1 < &2))

    Enum.each(primes, &(Agent.update(@name, fn c -> [&1|c] end)))

    case primes do
      [next|[]] -> [next|next_primes(last + 20)]
      [next|rest] -> primes
      _ -> next_primes(last + 20)
    end
  end
end

defmodule Math do
  require PrimeAgent

  @name {:global, __MODULE__}

  def start_link do
    PrimeAgent.start_link
  end

  def gcd(a, b) do
    case b do
      0 -> a
      _ -> gcd(b, rem(a, b))
    end
  end

  def lcm(a, b) do
    div(a * b, gcd(a, b))
  end

  def primes(n), do: PrimeAgent.primes(n)

  def is_prime?(n), do: PrimeAgent.is_prime?(n)

  def factor(n), do: PrimeAgent.factor(n)
  def factors(n) when n < 11, do: factors(n, 1, []) |> Enum.sort
  def factors(n) do
    Stream.take_while(1..n, &(&1 * &1 <= n))
    |> Stream.take_every(10)
    |> Enum.map(&(Task.async(fn -> factors(n, &1, []) end)))
    |> Enum.flat_map(&Task.await/1)
    |> Enum.uniq
    |> Enum.sort
  end

  defp factors(n, i, acc) do
    cond do
      i * i > n -> acc
      i * i == n -> [i|acc]
      rem(n, i) == 0 -> factors(n, i + 1, [i|[div(n, i)|acc]])
      true -> factors(n, i + 1, acc)
    end
  end

  def multiplicative_order(a, m) do
    func = &(do_mult_order(a, &1))
    case gcd(a, m) do
      1 -> factor(m) |> Enum.map(func) |> Enum.reduce(1, &(lcm(&1, &2)))
      _ -> nil
    end
  end

  defp do_mult_order(n, {f, o}) do
    m = :math.pow(f, o) |> round
    t = (f - 1) * (:math.pow(f, o - 1)) |> round
    facs = factors(t)
    |> Enum.filter(fn p -> :crypto.mod_pow(n, p, m) == <<1>> end)

    case facs do
      [order|_] -> order
      _ -> 1
    end
  end
end

defmodule Euler26 do
  require Math
  def solve(d) do 
    {largest, _} = 1..d 
    |> Enum.map(&({&1, Math.multiplicative_order(10, &1)}))
    |> Enum.filter(fn {_, m} -> m end) 
    |> Enum.max_by(fn {_, m} -> m end)
    largest
  end
end

Math.start_link
Euler26.solve(1000)
