defmodule ConectarInfoBackend.Router do
  use ConectarInfoBackend.Web, :router

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

  scope "/", ConectarInfoBackend do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ConectarInfoBackend do
    pipe_through :api

    resources "/events", EventController, except: [:new, :edit]
  end
end
