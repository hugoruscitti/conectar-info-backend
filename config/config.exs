# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :plug, :mimes, %{  
  "application/vnd.api+json" => ["json-api"]
  }

# Configures the endpoint
config :conectar_info_backend, ConectarInfoBackend.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "gC//1O7ZrtUKjZW3VSBxYp6W4G7lJWySP5Uf3Ia5s4iNcD/aDM3U7csXeHyrt8qW",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ConectarInfoBackend.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
