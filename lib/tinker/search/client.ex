defmodule Search.Client do
  @moduledoc """
  Client module for AWS Elasticsearch queries.
  """
  @behaviour Search.Client.Adapter

  @impl true
  def search(_term) do
    # Do some soul searchin'
  end
end
