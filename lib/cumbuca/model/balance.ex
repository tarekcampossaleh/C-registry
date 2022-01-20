defmodule Cumbuca.Model.Balance do
  alias Cumbuca.Repo
  import Cumbuca.Model.Connections

  def update_balance(user_id, value) do
    user = get_user(user_id)
    user = Ecto.Changeset.change(user, balance: user.balance + value)

    case Repo.update(user) do
      {:ok, struct} -> {:ok, struct}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def has_balance?(user_id, value) do
    user = get_user(user_id)
    user.balance >= value
  end
end
