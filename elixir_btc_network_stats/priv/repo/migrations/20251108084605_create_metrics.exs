defmodule ElixirBtcNetworkStats.Repo.Migrations.CreateMetrics do
  use Ecto.Migration

  def change do
    create table(:metrics) do
      add :difficulty, :float
      add :hashrate, :float
      add :btc_price, :float
      add :fetched_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
