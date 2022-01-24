defmodule CumbucaWeb.UserController do 
  use CumbucaWeb, :controller
  
  alias Cumbuca.Model.Connections

  def list_users(conn, _params) do
    user_list = Connections.list_users()
    render(conn,"user_list.json", user_list: user_list)
  end
end
