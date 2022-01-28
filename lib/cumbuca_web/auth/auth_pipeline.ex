defmodule CumbucaWeb.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :my_app,
    module: CumbucaWeb.GuardianSerializer,
    error_handler: CumbucaWeb.Guardian.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, scheme: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
end
