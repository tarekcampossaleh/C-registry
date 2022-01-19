defmodule Cumbuca.Model.Connections do
  import Ecto.Query, warn: false

  alias Cumbuca.Repo
  alias Cumbuca.Schemas.{Transaction, User}

  defp list_all(schema), do: Repo.all(schema)

  def list_users, do: list_all(User)

  # TODO:fix this, throwing an error: "user_id does not exist" ???
  def list_transaction, do: list_all(Transaction)

  def get_user(id), do: Repo.get!(User, id)
end
