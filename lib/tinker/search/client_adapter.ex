defmodule Search.Client.Adapter do
  @moduledoc """
  Behavior for Elasticsearch Client used to sync functions from prod/fake clients.
  """

  @doc """
  Search the given index using a query.
  """
  @callback search(query :: map()) :: {:ok, any()} | {:error, any()}
end
