use Mix.Config

config :tinker, Tinker.Repo,
  username: "postgres",
  password: "postgres",
  database: "tinker_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :tinker, TinkerWeb.Endpoint,
  http: [port: 4002],
  server: false,
  secret_key_base: "dJkkZVxR7ucenbh2MtzmttDnz7PH5Yzh820TFjx2t5Nx5LsFn4g4B2JrU9NDg/RR"

config :logger, level: :warn

config :stream_data,
  min_runs: 50,
  max_runs: 50
