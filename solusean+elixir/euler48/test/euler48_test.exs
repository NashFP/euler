defmodule Euler48Test do
  use ExUnit.Case
  doctest Euler48

  test "calculates self powers properly" do
    assert Euler48.Worker.self_powers(10) == 405071317
    assert Euler48.Worker.self_powers(10, 12) == 10405071317
    assert Euler48.Worker.self_powers(1000) == 9110846700
  end
end
