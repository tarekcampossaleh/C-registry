defmodule CumbucaWeb.UserView do 
  use CumbucaWeb, :view

  def render("user_list.json", %{user_list: user_list}) do
    %{data: render_many( user_list, CumbucaWeb.UserView, "user.json" )}
  end

  def render("user.json", %{user: user}) do 
    %{
      id: user.id,
      name: user.name,
      cpf: user.cpf,
      email: user.email,
      balance: user.balance,
    }
  end

  def render("balance.json",  %{user: user} ) do 
    %{balance: user.balance}
  end
end
