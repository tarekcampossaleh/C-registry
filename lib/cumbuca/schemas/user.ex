defmodule Cumbuca.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :name, :string
    field :cpf, :integer
    field :email, :string
    field :balance, :integer
    has_many :transaction, Cumbuca.Schemas.Transaction

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end

# TODO: default values
