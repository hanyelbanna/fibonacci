defmodule Fibonacci do
  @moduledoc """
  Concurrent Fibonacci Server With Elixir.
  """

  @doc """
  - Raise error if given number under 0
  """
  def calculate(n) when n < 0, do: raise("No Fibonacci Number under Zero. Please try again.")

  @doc """
  - Accept given number more than or equal to 0
  - Seround fib function return with {:ok, } tuple
  """
  def calculate(n) when is_integer(n) and n >= 0 do
    {:ok, fib(n, 0, 1)}
  end

  @doc """
  - Catch all
  """
  def calculate(n), do: {:error, "#{n} is an invalid input"}

  @doc """
  - For case fib(0,0,1)
  """
  def fib(0, _, _), do: 0

  @doc """
  fib(7,0,1)
  7,0,1
  6,1,1
  5,1,2
  4,2,3
  3,3,5
  2,5,8
  1,8,13 -> second (Fibonacci number for 7)
  """
  def fib(1, _first, second), do: second

  @doc """
  - Fibonacci sum last 2 numbers and add the sum to the next number.
  Slow way:
  - fib(n - 1) + fib(n - 2) will add a recursive loop to generate Fibonacci numbers depends on a given n number.
  # def fib(n) when is_integer(n) and n > 1, do: fib(n - 1) + fib(n - 2)
  Fast way:
  - Using tail recursion
  """
  def fib(n, first, second) when is_integer(n) and n > 1, do: fib(n - 1, second, first + second)
end
