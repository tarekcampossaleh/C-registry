defmodule CumbucaWeb.SessionView do
  use CumbucaWeb, :view

  def render("sign_in.json", %{user: user, jwt: jwt}) do
    %{
      data: %{
        token: jwt,
        email: user.email,
        id: user.id
      }
          }
  end
  
  def render("error.json", %{message: message}) do 
    %{
      data: message
    }
  end
end
