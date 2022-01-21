# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :cumbuca,
  ecto_repos: [Cumbuca.Repo]

# Configures the endpoint
config :cumbuca, CumbucaWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: CumbucaWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Cumbuca.PubSub,
  live_view: [signing_salt: "8ZBF7zT7"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :cumbuca, Cumbuca.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

# configures Guardian
config :cumbuca, Cumbuca.GuardianSerializer,
  issuer: "Cumbuca",
  secret_key: "YyT0wXsBG/026lUjvIcLatYp/GEc6ZONWqF6ZvhdlcBvXajlCWQ8h3zLflZtAosD",
  serializer: Cumbuca.GuardianSerializer
