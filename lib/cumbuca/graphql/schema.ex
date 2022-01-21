defmodule Cumbuca.Graphql.Schema do
  use Absinthe.Schema
  import_types Cumbuca.Graphql.Types

  alias Cumbuca.Graphql.Resolver.ChargeResolver
  
  query do 
    field :all_users, non_null(list_of(non_null(:user))) do 
      resolve(&ChargeResolver.all_users/3)
    end
  end
end
