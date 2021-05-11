defmodule Tinker.Acronym.PropertyTest do
  use ExUnit.Case
  use ExUnitProperties
  @moduletag :debug

  import Tinker.Acronym.Better, only: [abbreviate: 1]
  require Logger

  @string_min 3
  @string_max 20
  @runs 5

  # mix test.watch --only property
  #
  # Example of a Factory
  property "works with many different phrases" do
    check all(
            a <- generate_string(),
            b <- generate_string(),
            c <- generate_string(),
            phrase = "#{a} #{b} #{c}",
            min_runs: @runs,
            max_runs: @runs
          ) do
      # 1. conforms to contract
      assert {:ok, result} = abbreviate(phrase)
      # 2. should be a string
      assert String.valid?(result)
      # 3. should all be uppercase
      assert result == String.upcase(result)
      # 4. should not contain spaces
      assert result == String.trim(result)
      # 5. should only contain A-Z
      assert result
             |> String.to_charlist()
             |> Enum.all?(fn codepoint ->
               codepoint >= ?A and codepoint <= ?Z
             end)

      # https://hexdocs.pm/stream_data/ExUnitProperties.html#module-shrinking
      # Logger.warn("========================================")
      # Logger.warn("phrase: #{phrase}")
      # Logger.warn("result: #{result}")
    end
  end

  defp generate_string do
    string(:ascii, min_length: @string_min, max_length: @string_max)
  end
end
