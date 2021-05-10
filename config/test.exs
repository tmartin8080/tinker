use Mix.Config

# database_url = System.get_env("DATABASE_URL")

config :tinker, Tinker.Repo,
  username: "postgres",
  password: "postgres",
  database: "tinker_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  # url: database_url,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tinker, TinkerWeb.Endpoint,
  http: [port: 4002],
  server: false,
  secret_key_base: "dJkkZVxR7ucenbh2MtzmttDnz7PH5Yzh820TFjx2t5Nx5LsFn4g4B2JrU9NDg/RR"

# Print only warnings and errors during test
config :logger, level: :warn
