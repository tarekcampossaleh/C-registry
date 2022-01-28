defmodule CumbucaWeb.SessionControllerTest do
  use CumbucaWeb.ConnCase, async: false

  @sign_in_attrs %{email: "dummie@mail.com", password: "secret"}
  @wrong_sign_in_attrs %{email: "user@mail.com", password: "secret"}

  describe "Teste de autenticação:" do
    test "login", %{conn: conn} do
      user = %{
        email: "dummie@mail.com",
        password: "secret",
        cpf: "01010101001",
        name: "User"
      }

      Cumbuca.Model.Connections.create_user(user)

      conn = post(conn, Routes.session_path(conn, :sign_in), session: @sign_in_attrs)

      assert json_response(conn, 200)
    end

    test "email inválido", %{conn: conn} do
      user = %{
        email: "dummie@mail.com",
        password: "secret",
        cpf: "01010101001",
        name: "User"
      }

      Cumbuca.Model.Connections.create_user(user)

      conn = post(conn, Routes.session_path(conn, :sign_in), session: @wrong_sign_in_attrs)

      assert json_response(conn, 401) == %{"data" => "Não foi possivel fazer login"}
    end
  end
end
