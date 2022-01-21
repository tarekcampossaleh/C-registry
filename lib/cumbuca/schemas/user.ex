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
    |> cast(params, [:name, :cpf, :email, :balance])
    |> validate_required([:name, :cpf, :email])
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> unique_constraint(:email)
    |> unique_constraint(:cpf)
  end
end

# TODO: default values
#
    # |> validate_format(
    #  :cpf,
    #  ~r/([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})/
    #)
