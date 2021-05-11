defmodule Search.ClientMock do
  @moduledoc """
  Mock client for Testing.
  """
  @behaviour Search.Client.Adapter

  @impl true
  def search(_term) do
    # Mock soul searchin'
  end
end
