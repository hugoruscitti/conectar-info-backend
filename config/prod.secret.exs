use Mix.Config

config :conectar_info_backend, ConectarInfoBackend.Repo,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :conectar_info_backend, ConectarInfoBackend.Repo,
    adapter: Ecto.Adapters.Postgres,
    url: System.get_env("DATABASE_URL"),
    pool_size: 20
