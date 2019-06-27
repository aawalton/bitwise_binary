defmodule Bitwise.Binary.Test do
  use ExUnit.Case
  use PropCheck

  doctest Bitwise.Binary, import: true

  import Bitwise.Binary

  property "the result of a bitwise binary is a binary", [numtests: 1000] do

    forall binary <- binary() do 
      assert is_binary(bnot(binary))
      assert is_binary(~~~binary)

      forall int <- pos_integer() do
        assert is_binary(binary <<< int)
        assert is_binary(bsl(binary, int))
        assert is_binary(binary >>> int)
        assert is_binary(bsr(binary, int))
      end

      forall binary2 <- binary() do
        assert is_binary(binary &&& binary2)
        assert is_binary(band(binary, binary2))
        assert is_binary(binary ||| binary2)
        assert is_binary(bor(binary, binary2))
        assert is_binary(binary ^^^ binary2)
        assert is_binary(bxor(binary, binary2))
      end

    end

  end

end

