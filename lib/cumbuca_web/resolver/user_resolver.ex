defmodule CumbucaWeb.Resolver.UserResolver do
  alias Cumbuca.Model.Connections

  def create(args, _info) do
    Connections.create_user(args.name, args.password, args.cpf, args.email)
  end

  def current(_, %{context: %{current_user: user}}) do
    {:ok, user}
  end
  def current(_, info) do
    {:error, %{info: info.context}}
  end
end
