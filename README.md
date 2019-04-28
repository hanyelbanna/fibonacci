# Fibonacci

### Concurrent Fibonacci Server With Elixir.

## Try with iex

```
$ iex -S mix
iex(1)> Fibonacci.calculate(0)
iex(2)> Fibonacci.calculate(1)
iex(3)> Fibonacci.calculate(100)
iex(4)> Fibonacci.calculate(-1)
```

## Test

```
$ mix test
```

## Fibonacci API

#### Run the server

```
$ mix run --no-halt
```

#### Fibonacci Endpoint:

```
http://localhost:4000/fib/100
```

- Replace 100 in the URL with your Fibonacci number to see the result on the browser page body as JSON.
- Run some numbers to make a history list.

#### History Endpoint:

```
http://localhost:4000/his
```

#### History Count Endpoint:

```
http://localhost:4000/his_count
```

## Best Regarts, Hany.
