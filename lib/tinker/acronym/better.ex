defmodule Tinker.Acronym.Better do
  @moduledoc """
  Acronym generation module.
  """

  defguard is_special_character(codepoint) when codepoint in ' ,-'
  defguard is_lowercase(codepoint) when codepoint >= ?a and codepoint <= ?z
  defguard is_uppercase(codepoint) when codepoint >= ?A and codepoint <= ?Z
  @literal_space_codepoint 32

  @doc """
  Generate an acronym from a string.

  Uses recursion to step through each codepoint in a string
  to determine if it should be included in the acronym.

  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: {:ok, String.t()} | {:error, :invalid_type}
  def abbreviate(string) when is_binary(string) do
    result =
      string
      |> capitalise_first()
      |> do_abbreviate()
      |> IO.iodata_to_binary()

    {:ok, result}
  end

  def abbreviate(_), do: {:error, :invalid_type}

  # when current character is a space or punctuation and next character is lowercase
  # include next character, and remove literal spaces.
  defp do_abbreviate(<<first, next, rest::bits>>)
       when is_special_character(first) and is_lowercase(next) do
    [next - @literal_space_codepoint | do_abbreviate(rest)]
  end

  # include uppercase characters
  defp do_abbreviate(<<first, rest::bits>>) when is_uppercase(first) do
    [first | do_abbreviate(rest)]
  end

  # nothing to store, move on to next codepoint
  defp do_abbreviate(<<_, rest::bits>>), do: do_abbreviate(rest)

  # done return empty bitstring
  defp do_abbreviate(<<>>), do: <<>>

  defp capitalise_first(<<>>), do: <<>>

  defp capitalise_first(<<first, rest::bits>>) do
    String.upcase(<<first>>) <> rest
  end
end
