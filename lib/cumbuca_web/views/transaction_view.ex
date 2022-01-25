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
end
