defmodule CumbucaWeb.Resolver.ChargeResolver do
  alias Cumbuca.Model.Connections

  def all_users(_root, _args, _info) do
    {:ok, Connections.list_users()}
  end
end
