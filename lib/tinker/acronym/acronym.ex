defmodule Tinker.Acronym do
  # - Expects a string arg
  # - Returns a string 
  #
  # Success:
  # - generates acronym from a given phrase
  # - ignores a few punctuation characters
  #
  # Failure:
  # - invalid types passed as arg
  def abbreviate(s), do: s |> do_abbreviate() |> IO.iodata_to_binary()

  defp do_abbreviate(<<f, s, t::bits>>) when f in ' ,-' and s >= ?a and s <= ?z,
    do: [s - 32 | do_abbreviate(t)]

  defp do_abbreviate(<<f, t::bits>>) when f >= ?A and f <= ?Z, do: [f | do_abbreviate(t)]
  defp do_abbreviate(<<_, t::bits>>), do: do_abbreviate(t)
  defp do_abbreviate(<<>>), do: <<>>
end
