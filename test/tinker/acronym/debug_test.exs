defmodule Tinker.Acronym.PropertyTest do
  use ExUnit.Case
  use ExUnitProperties
  @moduletag :debug

  import Tinker.Acronym.Better, only: [abbreviate: 1]

  property "works with any set of phrases" do
    check all(
            a <- string(:ascii, max_length: 20),
            b <- string(:ascii, max_length: 20),
            c <- string(:ascii, max_length: 20),
            phrase = "#{a} #{b} #{c}"
          ) do
      IO.inspect(phrase, label: "PHRASE")
      assert {:ok, result} = abbreviate(phrase)
      assert result == String.upcase(result)
      assert result =~ ~r(^[^a-z]*$)
      IO.inspect(result, label: "----->")
    end
  end
end
