defmodule Fibonacci.Application do
  use Application

  alias Fibonacci.Endpoint

  def start(_type, _args),
    do: Supervisor.start_link(children(), opts())

  defp children do
    [Endpoint]
  end

  defp opts do
    [
      strategy: :one_for_one,
      name: Fibonacci.Supervisor
    ]
  end
end
