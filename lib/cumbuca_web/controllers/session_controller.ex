defmodule CumbucaWeb.SessionController do
  use CumbucaWeb, :controller

  alias Cumbuca.Model.Operations

  def sign_in(conn, %{"session" => %{"email" => email, "password" => password}}) do
    case Operations.find_and_confirm_password(email, password) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = CumbucaWeb.GuardianSerializer.encode_and_sign(user)

        conn
        |> render("sign_in.json", user: user, jwt: jwt)

      {:error, _reason} ->
        conn
        |> put_status(401)
        |> render("error.json", message: "Não foi possivel fazer login")
    end
  end
end
