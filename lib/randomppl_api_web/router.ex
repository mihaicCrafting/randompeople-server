defmodule RandompplApiWeb.Router do
  use RandompplApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RandompplApiWeb do
    pipe_through :api
    resources "/humans", HumanController, except: [:new, :edit]
    get "/humans/:id", HumanController, :show
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end


  scope "/", RandompplApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
