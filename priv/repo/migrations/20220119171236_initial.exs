defmodule Cumbuca.Repo.Migrations.Initial do
  use Ecto.Migration

  def change do
    create table("user") do
      add :name, :string
      add :cpf, :string
      add :email, :string
      add :balance, :integer
      add :password_hash, :string

      timestamps()
    end

    create table("transaction") do
      add :sender_id, references("user")
      add :receiver_id, references("user")
      add :value, :integer
      add :refundable, :boolean

      timestamps()
    end

    create unique_index(:user, [:email, :cpf])
  end
end
