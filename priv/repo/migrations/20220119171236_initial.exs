defmodule Cumbuca.Repo.Migrations.Initial do
  use Ecto.Migration

  def change do
    create table("user") do
      add :name, :string
      add :cpf, :integer
      add :email, :string
      add :balance, :integer

      timestamps()
    end

    create table("transaction") do
      add :sender_id, references("user")
      add :receiver_id, references("user")
      add :value, :integer

      timestamps()
    end
  end
end

# TODO: default values
# TODO: money value precision, currently we dont have a way to know the currency's and
# the digits precision
