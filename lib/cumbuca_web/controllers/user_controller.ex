defmodule CumbucaWeb.UserController do
  use CumbucaWeb, :controller

  alias Cumbuca.Model.Connections

  defp get_current_user(conn) do
    token = CumbucaWeb.GuardianSerializer.Plug.current_token(conn)
    {:ok, user, _claims} = CumbucaWeb.GuardianSerializer.resource_from_token(token)
    user
  end

  def list_users(conn, _params) do
    user_list = Connections.list_users()
    render(conn, "user_list.json", user_list: user_list)
  end

  def list_balance(conn, _params) do
    user = get_current_user(conn)
    render(conn, "balance.json", user: user)
  end
end
