defmodule CumbucaWeb.RegistrationViewTest do
  use CumbucaWeb.ConnCase
  alias CumbucaWeb.RegistrationView

  @id_attrs %{user: %{id: 1}}
  @changeset_attrs %{changeset: "changeset"}

  describe "Registro de Conta:" do
    test "success.json" do
      assert RegistrationView.render("success.json", @id_attrs) == %{
               id: 1,
               message: "Conta criada com sucesso!"
             }
    end

    test "error.json" do
      assert RegistrationView.render("error.json", @changeset_attrs) == %{
               message: "Não foi possivel criar a conta, campo inválido"
             }
    end
  end
end
