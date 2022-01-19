defmodule Cumbuca.Schemas.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transaction" do
    field :receiver_id, :integer
    field :sender_id, :integer
    field :value, :integer
    belongs_to :user, Cumbuca.Schemas.User

    timestamps()
  end

  def changeset(transaction, params \\ %{}) do
    transaction
    |> cast(params, [:value])
    |> validate_required([:value])
  end
end
