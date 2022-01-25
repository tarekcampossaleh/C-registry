defmodule CumbucaWeb.RegistrationControllerTest do 
  use CumbucaWeb.ConnCase, async: true
  alias Cumbuca.Repo

@user_attrs %{
    email: "user@mail.com", password: "secret",
    cpf: "01010101001", name: "User",
  }
@invalid_email_attrs %{
    email: "usermail.com", password: "secret",
    cpf: "01010101001", name: "User",
  }
@invalid_password_attrs %{
    email: "usermail.com", password: "secret",
    cpf: "01010101001", name: "User",
  }

  describe "Registro de Conta:" do

  test "post /sign_up", %{conn: conn} do
    conn = post(conn, Routes.registration_path(conn, :sign_up), user:  @user_attrs)

    assert json_response(conn, 201)
  end

  test "email inválido", %{conn: conn} do
    conn = post(conn, Routes.registration_path(conn, :sign_up), user:  @invalid_email_attrs)

    assert json_response(conn, 422)
  end

  test "senha inválida", %{conn: conn} do
    conn = post(conn, Routes.registration_path(conn, :sign_up), user:  @invalid_password_attrs)

    assert json_response(conn, 422)
    end
  end
end
