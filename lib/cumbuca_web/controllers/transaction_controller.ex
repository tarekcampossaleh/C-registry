defmodule CumbucaWeb.TransactionController do
  use CumbucaWeb, :controller

  alias Cumbuca.Model.Operations
  alias Cumbuca.Model.Balance

  defp get_current_user(conn) do
    token = CumbucaWeb.GuardianSerializer.Plug.current_token(conn)
    {:ok, user, _claims} = CumbucaWeb.GuardianSerializer.resource_from_token(token)
    user
  end

  def register_transaction(conn, %{
        "transaction" => %{"receiver_id" => receiver_id, "amount" => amount}
      }) do
    user = get_current_user(conn)

    case Operations.charge_transaction(user.id, receiver_id, amount) do
      {:ok, transaction, balance} ->
        render(conn, "transaction.json", %{transaction: transaction, balance: balance})

      {:error, message} ->
        conn
        |> put_status(:precondition_failed)
        |> render("error.json", message: message)
    end
  end

  def refund_transaction(conn, %{"transaction_id" => transaction_id}) do
    user = get_current_user(conn)

    case Balance.refund(user.id, transaction_id) do
      {:ok, transaction, balance} ->
        render(conn, "transaction.json", %{transaction: transaction, balance: balance})

      {:error, message} ->
        conn
        |> put_status(:precondition_failed)
        |> render("error.json", message: message)
    end
  end

  def query_transactions(conn, _params) do 
    user = get_current_user(conn)
    %{query_params: query} = conn
    %{"final_date" => final_date, "intial_date" => initial_date} = query

    case Operations.query_transactions(user.id, initial_date, final_date) do 
      {:ok, data} -> render(conn, "list_transactions.json", transaction_list: data)
      {:error, message} ->
        conn
        |> put_status(:precondition_failed)
        |> render("error.json", message: message)
    end
  end
end
