defmodule CumbucaWeb.Resolver.SessionResolver do
  alias Cumbuca.Repo
  alias Cumbuca.Schemas.User

  def create(args, _info) do
    user = Repo.get_by(User, email: args[:email])

    case authenticate(user, args[:password]) do
      true -> create_token(user)
      _ -> {:error, "O usuario não pode ser autenticado"}
    end
  end

  defp authenticate(user, password) do
    case user do
      nil -> false
      _ -> Bcrypt.verify_pass(password, user.password_hash)
    end
  end

  defp create_token(user) do
    case CumbucaWeb.GuardianSerializer.encode_and_sign(user) do
      {:ok, token, _full_claims} -> {:ok, %{token: token}}
      _ -> {:error, "Ocorreu um erro de autenticação"}
    end
  end
end
