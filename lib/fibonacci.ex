defmodule Fibonacci do
  use Agent

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
    start_agent()
    {:ok, caching(n)}
  end

  @doc """
  - Multiple calculations by Enum.map
  """
  def calculate(n) when is_list(n) do
    result = Enum.map(n, fn x -> caching(x) end)
    {:ok, result}
  end

  @doc """
  - Catch all
  """
  def calculate(n), do: {:error, "#{n} is an invalid input"}

  @doc """
  - To start Agent
  """
  def start_agent do
    Agent.start_link(fn -> %{0 => 0, 1 => 1} end, name: __MODULE__)
  end

  @doc """
  - Save new numbers in cached state at separate prossess with Agent abstraction
  """
  def caching(n) do
    if in_cached = Agent.get(__MODULE__, fn map -> Map.get(map, n) end) do
      IO.puts("#{n} - Cached: " <> inspect(Agent.get(__MODULE__, fn map -> map end)))
      in_cached
    else
      result = fib(n, 0, 1)
      IO.puts("#{n} - Not Cached")
      Agent.update(__MODULE__, fn map -> Map.put(map, n, result) end)
      result
    end
  end

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
  - Here we will go with fib function only one time with each number down to 1
  """
  def fib(n, first, second) when is_integer(n) and n > 1, do: fib(n - 1, second, first + second)

  @doc """
  - To display history
  """
  def history do
    start_agent()
    Agent.get(__MODULE__, & &1)
  end
end
