defmodule Cumbuca.Graphql.Schema do
  use Absinthe.Schema

  alias Cumbuca.Graphql.Resolver.ChargeResolver

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :cpf, non_null(:integer)
    field :email, non_null(:string)
    field :balance, non_null(:integer)
  end

  query do 
    field :all_users, non_null(list_of(non_null(:user))) do 
      resolve(&ChargeResolver.all_users/3)
    end
  end
end
