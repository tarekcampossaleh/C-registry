defmodule Cumbuca.Model.Connections do
  import Ecto.Query, warn: false

  alias Cumbuca.Repo
  alias Cumbuca.Schemas.{Transaction, User}

  defp list_all(schema), do: Repo.all(schema)

  def list_users, do: list_all(User)

  def list_transaction, do: list_all(Transaction) #TODO:fix this, throwing an error: "user_id does not exist" ???
end
