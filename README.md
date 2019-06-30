# Bitwise.Binary

The Elixir core package Bitwise defines bitwise operators and functions by passing inputs through to underlying Erlang functions such as `:erlang.band`. Surprisingly, these functions work only on integers and cannot be used on binaries.

`Bitwise.Binary` implements all of the functions and operators available in `Elixir.Bitwise` for binaries.

```
    iex> import Bitwise.Binary
    iex> "asdf" &&& <<255,255,255,255>>
    "asdf"

```


## Installation

Add `bitwise_binary` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bitwise_binary, "~> 0.1.0"}
  ]
end
```

Documentation can be found at [https://hexdocs.pm/bitwise_binary](https://hexdocs.pm/bitwise_binary).

