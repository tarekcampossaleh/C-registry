defmodule Cumbuca.Model.Operations do
  alias Cumbuca.Repo
  alias Cumbuca.Schemas.Transaction
  alias Cumbuca.Schemas.User

  import Cumbuca.Model.Balance

  defp register_transaction(sender_id, receiver_id, value) do
    Repo.insert(%Transaction{sender_id: sender_id, receiver_id: receiver_id, value: value})
  end

  def charge_transaction(sender_id, receiver_id, value) when sender_id != receiver_id do
    case has_balance?(sender_id, value) do
      true ->
        update_balance(sender_id, -value)
        update_balance(receiver_id, value)
        {:ok, transaction} = register_transaction(sender_id, receiver_id, value)
        {:ok, transaction, current_balance(sender_id)}
      false ->
        {:error, "Não há saldo suficiente em conta"}
    end
  end

  def find_and_confirm_password(email, password) do
    case Repo.get_by(User, email: email) do
      nil ->
        {:error, :not_found}

      user ->
        if Bcrypt.verify_pass(password, user.password_hash) do
          {:ok, user}
        else
          {:error, :unauthorized}
        end
    end
  end
end
