defmodule Tinker.Acronym.BetterTest do
  use ExUnit.Case

  import Tinker.Acronym.Better,
    only: [
      abbreviate: 1,
      is_special_character: 1,
      is_lowercase: 1,
      is_uppercase: 1
    ]

  describe "success: abbreviate/1" do
    test "handles title case" do
      assert {:ok, "PNG"} = abbreviate("Portable Networks Graphic")
    end

    test "includes character from lower case" do
      assert {:ok, "ROR"} = abbreviate("Ruby on Rails")
    end

    test "handles uppercase inside word" do
      assert {:ok, "HTML"} = abbreviate("HyperText Markup Language")
    end

    test "ignores punctuation" do
      assert {:ok, "FIFO"} = abbreviate("First in, First out")
    end

    test "ignores punctuation and casing" do
      assert {:ok, "CMOS"} = abbreviate("Complementary Metal-Oxide semiconductor")
    end

    test "abbreviates lower case first character" do
      assert {:ok, "TIAAP"} = abbreviate("this is an average potato")
    end

    test "returns empty string when passed empty string" do
      assert {:ok, ""} = abbreviate("")
    end
  end

  describe "failure: abbreviate/1" do
    test "with charlist" do
      assert {:error, :invalid_type} = abbreviate('dog')
    end

    test "with list" do
      assert {:error, :invalid_type} = abbreviate(["this is just great"])
    end
  end

  describe "guard: is_special_character/1" do
    test "returns true with space codepoint" do
      assert is_special_character(32) == true
    end

    test "returns false with literal space" do
      assert is_special_character(" ") == false
    end
  end

  describe "guard: is_lowercase/1" do
    test "returns true for lowercase char" do
      assert is_lowercase(?a) == true
    end

    test "returns false for uppercase char" do
      assert is_lowercase("?A") == false
    end
  end

  describe "guard: is_uppercase/1" do
    test "returns true for uppercase char" do
      assert is_uppercase(?A) == true
    end

    test "returns false for lowercase char" do
      assert is_uppercase("?a") == false
    end
  end
end
