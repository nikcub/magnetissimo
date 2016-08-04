defmodule Magnetissimo.Router do
  use Magnetissimo.Web, :router

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

  scope "/", Magnetissimo do
    pipe_through :browser # Use the default browser stack

    get "/", TorrentController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Magnetissimo do
  #   pipe_through :api
  # end
end
