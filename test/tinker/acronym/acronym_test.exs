defmodule Tinker.AcronymTest do
  use ExUnit.Case

  import Tinker.Acronym, only: [abbreviate: 1]

  describe "success: abbreviate/1" do
    test "handles title case" do
      assert abbreviate("Portable Networks Graphic") == "PNG"
    end

    test "includes character from lower case" do
      assert abbreviate("Ruby on Rails") == "ROR"
    end

    test "handles uppercase inside word" do
      assert abbreviate("HyperText Markup Language") == "HTML"
    end

    test "ignores punctuation" do
      assert abbreviate("First in, First out") == "FIFO"
    end

    test "ignores punctuation and casing" do
      assert abbreviate("Complementary Metal-Oxide semiconductor") == "CMOS"
    end
  end
end
