defmodule Cumbuca.Model.Connections do
  import Ecto.Query, warn: false

  alias Cumbuca.Repo
  alias Cumbuca.Schemas.{Transaction, User}

  defp list_all(schema), do: Repo.all(schema)

  def list_users, do: list_all(User)

  def get_transaction(id), do: Repo.get(Transaction, id)

  def get_user(id), do: Repo.get!(User, id)

  def create_user(user) do
    changeset = User.changeset(%User{}, user)
    Repo.insert(changeset)
  end
end
