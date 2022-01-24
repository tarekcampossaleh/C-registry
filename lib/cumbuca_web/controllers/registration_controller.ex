defmodule CumbucaWeb.RegistrationController do 
  use CumbucaWeb, :controller

  alias Cumbuca.Schemas.User
  alias Cumbuca.Repo

  def sign_up(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        #|> put_resp_header("location", user_path(conn, :show, user))
        |> render("success.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cumbuca.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
