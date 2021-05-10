defmodule TinkerWeb.Router do
  use TinkerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TinkerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", TinkerWeb.API, as: :api do
    pipe_through :api
    resources "/acronyms", AcronymsController, only: [:create]
  end
end
