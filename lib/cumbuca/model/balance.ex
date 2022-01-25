defmodule Cumbuca.Model.Balance do
  alias Cumbuca.Repo
  import Cumbuca.Model.Connections
  alias Cumbuca.Model.Operations

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

  def current_balance(user_id) do
    user = get_user(user_id)
    user.balance
  end

  def refund( user_id, transaction_id ) do
    transaction = get_transaction( transaction_id)
    case transaction.receiver_id === user_id and transaction.refundable === true do 
      true -> 
       Operations.charge_transaction( transaction.receiver_id, transaction.sender_id, transaction.value)
    transaction
    |> Ecto.Changeset.change(refundable: false)
    |> Repo.update()
    {:ok, transaction, current_balance(user_id)}
      false -> {:error, "O reembolso só pode ser solicitado pela conta recebedora"}
    end
     end
end
