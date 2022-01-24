defmodule CumbucaWeb.Router do
  use CumbucaWeb, :router

  alias CumbucaWeb.RegistrationController
  alias CumbucaWeb.SessionController

  pipeline :browser do
    plug :fetch_session
    plug :accepts, ["html"]
  end

  scope "/" do
    pipe_through :browser 
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    #plug Guardian.Plug.LoadResource
    #plug Guardian.Plug.Pipeline, module: CumbucaWeb.GuardianSerializer
  end

  pipeline :authenticated do
    plug Guardian.Plug.EnsureAuthenticated
  end

  #scope "/api/v1" do
  #  pipe_through :api 

  #  pipe_through :authenticated

  #  #resources "/users", UserController, except: [:new, :edit]
  #end
  
  scope "/api" do
    pipe_through :api

    post "/sign_up", RegistrationController, :sign_up

    post "/sign_in", SessionController, :sign_in
  end

  end
