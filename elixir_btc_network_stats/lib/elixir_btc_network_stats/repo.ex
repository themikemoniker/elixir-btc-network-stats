defmodule ElixirBtcNetworkStats.Repo do
  use Ecto.Repo,
    otp_app: :elixir_btc_network_stats,
    adapter: Ecto.Adapters.Postgres
end
