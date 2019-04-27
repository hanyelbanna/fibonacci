defmodule FibonacciTest do
  use ExUnit.Case
  doctest Fibonacci

  test "return {:ok, 0} for given 0" do
    assert Fibonacci.calculate(0) == {:ok, 0}
  end

  test "return {:ok, 1} for given 1" do
    assert Fibonacci.calculate(1) == {:ok, 1}
  end

  test "return {:ok, 13} for given 7" do
    assert Fibonacci.calculate(7) == {:ok, 13}
  end

  test "No Fibonacci Number under Zero" do
    assert_raise RuntimeError, fn -> Fibonacci.calculate(-1) end
  end

  # test "return {:ok, 354224848179261915075} for given 100" do
  #   assert Fibonacci.calculate(100) == {:ok, 354_224_848_179_261_915_075}
  # end
end
