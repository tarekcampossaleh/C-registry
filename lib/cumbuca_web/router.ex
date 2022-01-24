defmodule CumbucaWeb.Router do
  use CumbucaWeb, :router

  alias CumbucaWeb.RegistrationController
  alias CumbucaWeb.SessionController
  alias CumbucaWeb.UserController

  pipeline :browser do
    plug :fetch_session
    plug :accepts, ["html"]
  end

  scope "/" do
    pipe_through :browser 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug CumbucaWeb.Guardian.AuthPipeline
  end

  #scope "/api/v1" do
  #  pipe_through :api 

  #  pipe_through :authenticated

  #  #resources "/users", UserController, except: [:new, :edit]
  #end
  
  scope "/api" do
    pipe_through [:api] 

    post "/sign_up", RegistrationController, :sign_up

    post "/sign_in", SessionController, :sign_in

    get "/users", UserController, :list_users

  end

  scope "/api" do
    pipe_through [:api, :authenticated] 

    get "/balance", UserController, :list_balance
  end

  end
