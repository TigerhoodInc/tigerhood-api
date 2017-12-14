defmodule TigerhoodApiWeb.Router do
  use TigerhoodApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TigerhoodApiWeb do
    pipe_through :api
    resources "/tigers", TigerController, except: [:new, :edit]
  end
end
