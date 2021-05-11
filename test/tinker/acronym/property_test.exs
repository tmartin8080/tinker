defmodule Tinker.Acronym.PropertyTest do
  use ExUnit.Case
  use ExUnitProperties
  @moduletag :debug

  import Tinker.Acronym.Better, only: [abbreviate: 1]

  # mix test.watch --only property
  # https://hexdocs.pm/stream_data/ExUnitProperties.html#module-shrinking
  #
  # Example of a Factory
  property "works with many different phrases" do
    check all(
            a <- string(:ascii, min_length: 3, max_length: 20),
            b <- string(:ascii, min_length: 3, max_length: 20),
            c <- string(:ascii, min_length: 3, max_length: 20),
            phrase = "#{a} #{b} #{c}",
            min_runs: 10,
            max_runs: 10
          ) do
      # implements contract
      assert {:ok, result} = abbreviate(phrase)
      # should be a string
      assert String.valid?(result)
      # should all be uppercase
      assert result == String.upcase(result)
      # should not contain spaces
      assert result == String.trim(result)
      # should only contain A-Z
      assert result
             |> String.to_charlist()
             |> Enum.all?(fn codepoint ->
               codepoint >= ?A and codepoint <= ?Z
             end)

      # IO.inspect(phrase, label: "phrase")
      # IO.inspect(result, label: "abbr->")
    end
  end
end
