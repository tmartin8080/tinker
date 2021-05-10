defmodule TinkerWeb.API.AcronymsController do
  use TinkerWeb, :controller

  import Tinker.Acronym.Better, only: [abbreviate: 1]

  def create(conn, %{"phrase" => phrase}) do
    case abbreviate(phrase) do
      {:ok, result} ->
        json(conn, %{data: result})

      {:error, type} ->
        error_response(conn, :im_a_teapot, Atom.to_string(type))
    end
  end

  def create(conn, _) do
    error_response(conn, :unprocessable_entity, "phrase parameter required")
  end

  defp error_response(conn, status, error) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> put_status(status)
    |> json(%{"error" => error})
  end
end
