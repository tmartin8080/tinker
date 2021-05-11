defmodule TinkerWeb.API.SearchController do
  use TinkerWeb, :controller

  @client Application.fetch_env!(:tinker, :search_client)

  def search(conn, %{"term" => term}) do
    case @client.search(term) do
      {:ok, result} ->
        json(conn, %{data: result})

      {:error, type} ->
        # error_response(conn, :im_a_teapot, Atom.to_string(type))
        json(conn, %{error: type})
    end
  end
end
