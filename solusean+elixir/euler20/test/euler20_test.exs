defmodule Euler20Test do
  use ExUnit.Case, async: true

  test "it properly calculates sum" do
    assert Euler20.Worker.sum_factorial(10) == 27
    assert Euler20.Worker.sum_factorial(30) == 117
    assert Euler20.Worker.sum_factorial(50) == 216
  end
end
