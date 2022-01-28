defmodule CumbucaWeb.Router do
  use CumbucaWeb, :router

  alias CumbucaWeb.RegistrationController
  alias CumbucaWeb.SessionController
  alias CumbucaWeb.UserController
  alias CumbucaWeb.TransactionController

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

  scope "/" do
    pipe_through [:api]

    post "/sign_up", RegistrationController, :sign_up

    post "/sign_in", SessionController, :sign_in

  end

  scope "/" do
    pipe_through [:api, :authenticated]

    get "/balance", UserController, :list_balance

    post "/transaction", TransactionController, :register_transaction

    get "/transaction", TransactionController, :query_transactions

    post "/refund", TransactionController, :refund_transaction
  end
end
