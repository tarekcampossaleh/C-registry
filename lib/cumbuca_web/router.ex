defmodule CumbucaWeb.Router do
  use CumbucaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :graphql do
    plug CumbucaWeb.Context
  end

  #pipeline :graphql do
  #  plug Plug.Parsers,
  #    parsers: [:urlencoded, :multipart, :json],
  #    pass: ["*/*"],
  #    json_decoder: Poison
  #  plug Cumbuca.Context
  #end

  scope "/api" do
    pipe_through :graphql
 
    forward "/", Absinthe.Plug,
      schema: CumbucaWeb.Schema
  end
 
  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: CumbucaWeb.Schema

  #scope "/graphql" do
  #  pipe_through :graphql

  #  forward "/", Absinthe.Plug, schema: Cumbuca.Graphql.Schema
  #end

  #scope "/", Cumbuca do
  #  pipe_through :browser # Use the default browser stack

  #  #get "*path", PageController, :index
  #end

end
