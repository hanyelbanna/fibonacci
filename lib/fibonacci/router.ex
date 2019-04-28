defmodule Fibonacci.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/his" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(
      200,
      Poison.encode!(Map.new(Fibonacci.history()))
    )
  end

  get "/his_count" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(
      200,
      Poison.encode!(Fibonacci.history_count())
    )
  end

  get "/fib/:num" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(
      200,
      Poison.encode!(Tuple.to_list(Fibonacci.calculate(String.to_integer(num))))
    )
  end
end
