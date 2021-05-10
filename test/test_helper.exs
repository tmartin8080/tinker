ExUnit.configure(exclude: :debug)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Tinker.Repo, :manual)
