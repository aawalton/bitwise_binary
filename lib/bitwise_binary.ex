defmodule Bitwise.Binary do
  @moduledoc """
  Simple module to extend bitwise operations to full binaries (and not just integers)
  TODO: Rewrite everything to interpret the binaries as unsigned big integer
  bin_size = byte_size(bin) * 8
  <<bin_int :: unsigned-big-integer-size(ibn_size)>> = bin

  TODO: Add property to generate ints, compare these vs erlang functions.

  TODO: Add left and right rotation
  """
  
  @doc """
  Calculates the bitwise NOT of its arguments.

      iex> ~~~<<2, 0>>
      <<253, 255>>

  """
  def ~~~expr when is_binary(expr) do
    bit_size = byte_size(expr) * 8
    << expr |> :binary.decode_unsigned |> :erlang.bnot :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the bitwise NOT of its arguments.

      iex> bnot(<<2, 0>>)
      <<253, 255>>

  """
  def bnot(expr) when is_binary(expr) do
    bit_size = byte_size(expr) * 8
    << expr |> :binary.decode_unsigned |> :erlang.bnot :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the bitwise AND of its arguments.

      iex> <<9, 0>> &&& <<3, 0>>
      <<1, 0>>

  """
  def left &&& right when is_binary(left) and is_binary(right) do
    bit_size = max(byte_size(left), byte_size(right)) * 8
    << :erlang.band(:binary.decode_unsigned(left), :binary.decode_unsigned(right)) :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the bitwise AND of its arguments.

      iex> band(<<9, 0>>, <<3, 0>>)
      <<1, 0>>

  """
  def band(left, right) when is_binary(left) and is_binary(right) do
    bit_size = max(byte_size(left), byte_size(right)) * 8
    << :erlang.band(:binary.decode_unsigned(left), :binary.decode_unsigned(right)) :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the bitwise OR of its arguments.

      iex> <<9, 0>> ||| <<3, 0>>
      <<11, 0>>

  """
  def left ||| right when is_binary(left) and is_binary(right) do
    bit_size = max(byte_size(left), byte_size(right)) * 8
    << :erlang.bor(:binary.decode_unsigned(left), :binary.decode_unsigned(right)) :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the bitwise OR of its arguments.

      iex> bor(<<9, 0>>, <<3, 0>>)
      <<11, 0>>

  """
  def bor(left, right) when is_binary(left) and is_binary(right) do
    bit_size = max(byte_size(left), byte_size(right)) * 8
    << :erlang.bor(:binary.decode_unsigned(left), :binary.decode_unsigned(right)) :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the bitwise XOR of its arguments.

      iex> <<9, 0>> ^^^ <<3, 0>>
      <<10, 0>>

  """
  def left ^^^ right when is_binary(left) and is_binary(right) do
    bit_size = max(byte_size(left), byte_size(right)) * 8
    << :erlang.bxor(:binary.decode_unsigned(left), :binary.decode_unsigned(right)) :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the bitwise XOR of its arguments.

      iex> <<9, 0>> ^^^ <<3, 0>>
      <<10, 0>>

  """
  def bxor(left, right) when is_binary(left) and is_binary(right) do
    bit_size = max(byte_size(left), byte_size(right)) * 8
    << :erlang.bxor(:binary.decode_unsigned(left), :binary.decode_unsigned(right)) :: unsigned-big-integer-size(bit_size) >>
  end
  
  @doc """
  Calculates the result of an arithmetic left shift.

      iex> <<1, 0>> <<< 2
      <<4, 0>>

  """
  def left <<< right when is_binary(left) and is_integer(right) do
    bit_size = byte_size(left) * 8
    << :erlang.bsl(:binary.decode_unsigned(left), right) :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the result of an arithmetic left shift.

      iex> <<1, 0>> <<< 2
      <<4, 0>>

  """
  def bsl(left, right) when is_binary(left) and is_integer(right) do
    bit_size = byte_size(left) * 8
    << :erlang.bsl(:binary.decode_unsigned(left), right) :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the result of an arithmetic right shift.

      iex> <<4, 0>> >>> 2
      <<1, 0>>

  """
  def left >>> right when is_binary(left) and is_integer(right) do
    bit_size = byte_size(left) * 8
    << :erlang.bsr(:binary.decode_unsigned(left), right) :: unsigned-big-integer-size(bit_size) >>
  end

  @doc """
  Calculates the result of an arithmetic right shift.

      iex> <<4, 0>> >>> 2
      <<1, 0>>

  """
  def bsr(left, right) when is_binary(left) and is_integer(right) do
    bit_size = byte_size(left) * 8
    << :erlang.bsr(:binary.decode_unsigned(left), right) :: unsigned-big-integer-size(bit_size) >>
  end

end
