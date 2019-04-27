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
  def calculate(n) when n >= 0 do
    {:ok, fib(n)}
  end

  @doc """
  - Add fixed return to 0 because 0 and 1 are the first 2 numbers which Fibonacci will use to return the rest of numbers.
  """
  def fib(0), do: 0

  @doc """
  - Add fixed return to 1 because 0 and 1 are the first 2 numbers which Fibonacci will use to return the rest of numbers.
  """
  def fib(1), do: 1

  @doc """
  - Fibonacci sum last 2 numbers and add the sum to the next number.
  - fib(n - 1) + fib(n - 2) will add a recursive loop to generate Fibonacci numbers depends on a given n number.
  """
  def fib(n) when n > 1, do: fib(n - 1) + fib(n - 2)
end
