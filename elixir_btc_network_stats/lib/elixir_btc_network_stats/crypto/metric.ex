defmodule ElixirBtcNetworkStats.Crypto.Metric do
  use Ecto.Schema
  import Ecto.Changeset

  schema "metrics" do
    field :difficulty, :float
    field :hashrate, :float
    field :btc_price, :float
    field :fetched_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(metric, attrs) do
    metric
    |> cast(attrs, [:difficulty, :hashrate, :btc_price, :fetched_at])
    |> validate_required([:difficulty, :hashrate, :btc_price, :fetched_at])
  end
end
