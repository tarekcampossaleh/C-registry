defmodule CumbucaWeb.Types do
  use Absinthe.Schema.Notation

  @desc "Conta de usuario"
  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :cpf, non_null(:integer)
    field :email, non_null(:string)
    field :balance, non_null(:integer)
  end

  @desc "JWT Token"
  object :token do
    field :token, :string
  end
end
