defmodule ElixirBtcNetworkStats.CryptoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirBtcNetworkStats.Crypto` context.
  """

  @doc """
  Generate a metric.
  """
  def metric_fixture(attrs \\ %{}) do
    {:ok, metric} =
      attrs
      |> Enum.into(%{
        btc_price: 120.5,
        difficulty: 120.5,
        fetched_at: ~U[2025-11-07 08:46:00Z],
        hashrate: 120.5
      })
      |> ElixirBtcNetworkStats.Crypto.create_metric()

    metric
  end
end
