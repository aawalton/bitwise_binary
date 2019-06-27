defmodule Bitwise.Binary do
  @moduledoc """
  Simple module to extend bitwise operations to full binaries (and not just integers).
  """

  @doc """
  Calculates the bitwise AND of its arguments.

      iex> <<9, 0>> &&& <<3, 0>>
      <<1, 0>>

  """
  def left &&& right when is_binary(left) and is_binary(right) do
    band(left, right)
  end

  @doc """
  Calculates the bitwise AND of its arguments.

      iex> band(<<9, 0>>, <<3, 0>>)
      <<1, 0>>

  """
  def band(left, right) when is_binary(left) and is_binary(right) do
    Enum.zip(:erlang.binary_to_list(left), :erlang.binary_to_list(right))
    |> Enum.map(fn {x, y} -> :erlang.band(x, y) end)
    |> :erlang.list_to_binary()
  end

  @doc """
  Calculates the bitwise NOT of its arguments.

      iex> ~~~<<2, 0>>
      <<253, 255>>

  """
  def ~~~expr when is_binary(expr) do
    bnot(expr)
  end

  @doc """
  Calculates the bitwise NOT of its arguments.

      iex> bnot(<<2, 0>>)
      <<253, 255>>

  """
  def bnot(expr) when is_binary(expr) do
    :erlang.binary_to_list(expr)
    |> Enum.map(fn x -> <<:erlang.bnot(x)>> end)
    |> Enum.join("")
  end

  @doc """
  Calculates the bitwise OR of its arguments.

      iex> <<9, 0>> ||| <<3, 0>>
      <<11, 0>>

  """
  def left ||| right when is_binary(left) and is_binary(right) do
    bor(left, right)
  end

  @doc """
  Calculates the bitwise OR of its arguments.

      iex> bor(<<9, 0>>, <<3, 0>>)
      <<11, 0>>

  """
  def bor(left, right) when is_binary(left) and is_binary(right) do
    Enum.zip(:erlang.binary_to_list(left), :erlang.binary_to_list(right))
    |> Enum.map(fn {x, y} -> :erlang.bor(x, y) end)
    |> :erlang.list_to_binary()
  end

  @doc """
  Calculates the result of an arithmetic left shift.

      iex> <<1, 0>> <<< 2
      <<4, 0>>

  """
  def left <<< right when is_binary(left) and is_integer(right) do
    bsl(left, right)
  end

  @doc """
  Calculates the result of an arithmetic left shift.

      iex> <<1, 0>> <<< 2
      <<4, 0>>

  """
  def bsl(left, right) when is_binary(left) and is_integer(right) do
    :erlang.binary_to_list(left)
    |> Enum.map(fn x -> <<:erlang.bsl(x, right)>> end)
    |> Enum.join("")
  end

  @doc """
  Calculates the result of an arithmetic right shift.

      iex> <<4, 0>> >>> 2
      <<1, 0>>

  """
  def left >>> right when is_binary(left) and is_integer(right) do
    bsr(left, right)
  end

  @doc """
  Calculates the result of an arithmetic right shift.

      iex> <<4, 0>> >>> 2
      <<1, 0>>

  """
  def bsr(left, right) when is_binary(left) and is_integer(right) do
    :erlang.binary_to_list(left)
    |> Enum.map(fn x -> <<:erlang.bsr(x, right)>> end)
    |> Enum.join("")
  end

  @doc """
  Calculates the bitwise XOR of its arguments.

      iex> <<9, 0>> ^^^ <<3, 0>>
      <<10, 0>>

  """
  def left ^^^ right when is_binary(left) and is_binary(right) do
    bxor(left, right)
  end

  @doc """
  Calculates the bitwise XOR of its arguments.

      iex> <<9, 0>> ^^^ <<3, 0>>
      <<10, 0>>

  """
  def bxor(left, right) when is_binary(left) and is_binary(right) do
    Enum.zip(:erlang.binary_to_list(left), :erlang.binary_to_list(right))
    |> Enum.map(fn {x, y} -> :erlang.bxor(x, y) end)
    |> :erlang.list_to_binary()
  end
end
