defmodule CumbucaWebRegistrationViewTest do
  use CumbucaWeb.ConnCase
  alias Cumbuca.Repo
  alias CumbucaWeb.RegistrationView

  @id_attrs %{user: %{id: 1}}
  @changeset_attrs %{changeset: "changeset"}

  describe "Registro de Conta:" do
    test "success.json", %{conn: conn} do
      assert RegistrationView.render("success.json", @id_attrs) == %{
               id: 1,
               message: "Conta criada com sucesso!"
             }
    end

    test "error.json", %{conn: conn} do
      assert RegistrationView.render("error.json", @changeset_attrs) == %{
               message: "Não foi possivel criar a conta, campo inválido"
             }
    end
  end
end
