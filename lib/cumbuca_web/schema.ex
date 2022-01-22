defmodule CumbucaWeb.Schema do
  use Absinthe.Schema
  import_types(CumbucaWeb.Types)

  alias CumbucaWeb.Resolver.ChargeResolver
  alias CumbucaWeb.Resolver.UserResolver
  alias CumbucaWeb.Resolver.SessionResolver

  query do
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&ChargeResolver.all_users/3)
    end

    field :current_user, type: :user do
      resolve(&UserResolver.current/2)
    end
  end

  mutation do
    @desc "Cria a conta de um usuario"
    field :user, type: :user do
      arg(:name, non_null(:string))
      arg(:cpf, non_null(:integer))
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&UserResolver.create/2)
    end

    @desc "Login de conta"
    field :session, :token do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&SessionResolver.create/2)
    end
  end
end
