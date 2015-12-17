defmodule VersionWarehouse.Router do
  use VersionWarehouse.Web, :router

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

  scope "/", VersionWarehouse do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", VersionWarehouse do
    pipe_through :api

    resources "/versions", VersionController, except: [:new, :edit]
  end
end
