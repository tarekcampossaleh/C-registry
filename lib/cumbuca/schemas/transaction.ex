defmodule Cumbuca.Schemas.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transaction" do
    field :receiver_id, :integer
    field :sender_id, :integer
    field :value, :integer
    field :refundable, :boolean, default: true

    timestamps()
  end

  def changeset(transaction, params \\ %{}) do
    transaction
    |> cast(params, [:value, :refundable])
    |> validate_required([:value])
    |> put_change(:refundable, true)
  end
end
