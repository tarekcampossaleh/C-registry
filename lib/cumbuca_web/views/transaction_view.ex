defmodule CumbucaWeb.TransactionView do
  use CumbucaWeb, :view

  def render("transaction.json", %{transaction: transaction, balance: balance}) do
    %{
      transaction: %{
        id: transaction.id,
        receiver: transaction.receiver_id,
        amount: transaction.value,
        process_data: NaiveDateTime.to_string(transaction.inserted_at)
      },
      new_balance: balance
    }
  end

  def render("error.json", %{message: message}) do
    %{status: :error, message: message}
  end

  def render("list_transactions.json", %{transaction_list: transaction_list}) do
    %{data: render_many(transaction_list, CumbucaWeb.TransactionView, "transaction_view.json")}
  end

  def render("transaction_view.json", %{transaction: transaction}) do
    %{
      transaction: %{
        id: transaction.id,
        sender: transaction.sender_id,
        receiver: transaction.receiver_id,
        amount: transaction.value,
        process_data: NaiveDateTime.to_string(transaction.inserted_at)
      }
    }
  end
end
