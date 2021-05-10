defmodule TinkerWeb.PageController do
  use TinkerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
