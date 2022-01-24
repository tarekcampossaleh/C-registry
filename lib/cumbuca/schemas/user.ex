defmodule Cumbuca.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :name, :string
    field :cpf, :integer
    field :email, :string
    field :balance, :integer
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :transaction, Cumbuca.Schemas.Transaction

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :cpf, :email, :balance, :password])
    |> validate_required([:name, :cpf, :email, :password])
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> unique_constraint(:email)
    |> unique_constraint(:cpf)
    |> hash_password()
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(pass))

      _ ->
        changeset
    end
  end


end

# TODO: default values
#
# |> validate_format(
#  :cpf,
#  ~r/([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})/
# )
