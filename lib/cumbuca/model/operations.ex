defmodule Cumbuca.Model.Operations do
  alias Cumbuca.Repo
  alias Cumbuca.Schemas.Transaction

  import Cumbuca.Model.Balance

  def register_transaction(sender_id, receiver_id, value) do
    Repo.insert(%Transaction{sender_id: sender_id, receiver_id: receiver_id, value: value})
  end

  def charge_transaction(sender_id, receiver_id, value) when sender_id != receiver_id do
    case has_balance?(sender_id, value) do
      true ->
        update_balance(sender_id, -value)
        update_balance(receiver_id, value)
        register_transaction(sender_id, receiver_id, value)

      false ->
        {:error, "Não há saldo suficiente em conta"}
    end
  end
end
