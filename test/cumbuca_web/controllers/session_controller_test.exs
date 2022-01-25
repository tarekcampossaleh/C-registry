defmodule CumbucaWeb.SessionControllerTest do
  use CumbucaWeb.ConnCase 
  alias CumbucaWeb.GuardianSerializer

  user = %{
    email: "user@mail.com", password: "secret",
    cpf: "01010101001", name: "User",
  }

  @sign_in_attrs  %{"email": user.email, "password": user.password }


  test "Teste de autenticação", %{conn: conn} do
    conn = post(conn, Routes.session_path(conn, :sign_in), session: @sign_in_attrs)
    
    assert json_response(conn, 200)

  end
end
