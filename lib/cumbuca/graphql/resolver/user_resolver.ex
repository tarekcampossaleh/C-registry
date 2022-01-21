defmodule Cumbuca.Graphql.Resolver.UserResolver do
  alias Cumbuca.Model.Connections

  def create(args, _info) do
    Connections.create_user(args.name, args.password, args.cpf, args.email)
  end

  def current(_, %{context: %{current_user: current_user}}) do
    {:ok, current_user}
  end

  def current(_, _) do
    {:error, "Access denied"}
  end
end
