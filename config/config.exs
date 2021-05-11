import Config

config :tinker,
  ecto_repos: [Tinker.Repo]

config :tinker, TinkerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dJkkZVxR7ucenbh2MtzmttDnz7PH5Yzh820TFjx2t5Nx5LsFn4g4B2JrU9NDg/RR",
  render_errors: [view: TinkerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tinker.PubSub,
  live_view: [signing_salt: "/tK1GtBx"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# config.exs
config :tinker, search_client: Search.Client

import_config "#{Mix.env()}.exs"
