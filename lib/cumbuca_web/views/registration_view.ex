defmodule CumbucaWeb.RegistrationView do
  use CumbucaWeb, :view

  def render("success.json", %{user: user}) do
    %{
      id: user.id,
      message: "Conta criada com sucesso!"
    }
  end

  def render("error.json", %{changeset: _changeset}) do
    %{
      message: "Não foi possivel criar a conta, campo inválido" 
    }
  end
end

