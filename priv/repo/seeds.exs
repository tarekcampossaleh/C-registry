# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cumbuca.Repo.insert!(%Cumbuca.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
#
alias Cumbuca.Repo
alias Cumbuca.Schemas.{Transaction, User}


%User{
  name: "Primeiro Usuario Teste",
  cpf: 0_101_010_101,
  email: "initial_one@user.com",
  balance: 0
}
|> Repo.insert!()

%User{
  name: "Segundo Usuario Teste",
  cpf: 0_202_020_202,
  email: "initial_two@user.com",
  balance: 0
}
|> Repo.insert!()
