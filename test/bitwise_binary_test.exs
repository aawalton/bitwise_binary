defmodule Bitwise.Binary.Test do
  use ExUnit.Case
  use PropCheck

  doctest Bitwise.Binary, import: true

  import Bitwise.Binary

  property "the result of a bitwise binary is a binary" do
    forall left <- binary() do
      assert is_binary(bnot(left))
      assert is_binary(~~~left)

      forall right <- pos_integer() do
        assert is_binary(left <<< right)
        assert is_binary(bsl(left, right))
        assert is_binary(left >>> right)
        assert is_binary(bsr(left, right))
      end

      forall right <- binary() do
        assert is_binary(left &&& right)
        assert is_binary(band(left, right))
        assert is_binary(left ||| right)
        assert is_binary(bor(left, right))
        assert is_binary(left ^^^ right)
        assert is_binary(bxor(left, right))
      end
    end
  end

  property "the result of a bitwise binary is the length of its longest input" do
    forall left <- binary() do
      assert byte_size(bnot(left)) == byte_size(left)
      assert byte_size(~~~left) == byte_size(left)

      forall right <- pos_integer() do
        assert byte_size(left <<< right) == byte_size(left)
        assert byte_size(bsl(left, right)) == byte_size(left)
        assert byte_size(left >>> right) == byte_size(left)
        assert byte_size(bsr(left, right)) == byte_size(left)
      end

      forall right <- binary() do
        assert byte_size(left &&& right) == max(byte_size(left), byte_size(right))
        assert byte_size(band(left, right)) == max(byte_size(left), byte_size(right))
        assert byte_size(left ||| right) == max(byte_size(left), byte_size(right))
        assert byte_size(bor(left, right)) == max(byte_size(left), byte_size(right))
        assert byte_size(left ^^^ right) == max(byte_size(left), byte_size(right))
        assert byte_size(bxor(left, right)) == max(byte_size(left), byte_size(right))
      end
    end
  end

  property "double negation produces the original input" do
    forall left <- binary() do
      assert ~~~(~~~left) == left
      assert bnot(bnot(left)) == left
    end
  end

  property "bitwise and with itself is itself" do
    forall left <- binary() do
      assert (left &&& left) == left
      assert band(left, left) == left
    end
  end

  property "bitwise or with itself is itself" do
    forall left <- binary() do
      assert (left ||| left) == left
      assert bor(left, left) == left
    end
  end

  property "bitwise xor with itself is zeros" do
    forall left <- binary() do
      bit_size = byte_size(left) * 8
      assert left ^^^ left == <<0 :: size(bit_size)>>
      assert bxor(left, left) == <<0 :: size(bit_size)>>
    end
  end

  property "shifting full length should always result in zero" do
    forall left <- binary() do
      bit_size = byte_size(left) * 8
      assert bsr(left, bit_size) == <<0 :: size(bit_size)>>
      assert bsl(left, bit_size) == <<0 :: size(bit_size)>>
    end
  end

  property "rotating one way and back by the same amount is equal to the start" do
    forall {left, rotation} <- {binary(), integer()} do
      assert (left |> brl(rotation) |> brr(rotation)) == left
      assert (left |> brr(rotation) |> brl(rotation)) == left
    end
  end

end
