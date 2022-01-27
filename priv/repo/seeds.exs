# Script for populating the database with Admin User

alias Cumbuca.Repo
alias Cumbuca.Schemas. User

 params = %{
  name: "Admin",
  cpf: "010.010.010-01",
  email: "admin@root.com",
  password: "secret"
}
User.changeset(%User{}, params)
|> Ecto.Changeset.change(balance: 50000)
 |> Repo.insert!()
