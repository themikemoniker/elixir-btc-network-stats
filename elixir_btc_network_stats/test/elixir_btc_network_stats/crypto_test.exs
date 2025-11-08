defmodule ElixirBtcNetworkStats.CryptoTest do
  use ElixirBtcNetworkStats.DataCase

  alias ElixirBtcNetworkStats.Crypto

  describe "metrics" do
    alias ElixirBtcNetworkStats.Crypto.Metric

    import ElixirBtcNetworkStats.CryptoFixtures

    @invalid_attrs %{difficulty: nil, hashrate: nil, btc_price: nil, fetched_at: nil}

    test "list_metrics/0 returns all metrics" do
      metric = metric_fixture()
      assert Crypto.list_metrics() == [metric]
    end

    test "get_metric!/1 returns the metric with given id" do
      metric = metric_fixture()
      assert Crypto.get_metric!(metric.id) == metric
    end

    test "create_metric/1 with valid data creates a metric" do
      valid_attrs = %{difficulty: 120.5, hashrate: 120.5, btc_price: 120.5, fetched_at: ~U[2025-11-07 08:46:00Z]}

      assert {:ok, %Metric{} = metric} = Crypto.create_metric(valid_attrs)
      assert metric.difficulty == 120.5
      assert metric.hashrate == 120.5
      assert metric.btc_price == 120.5
      assert metric.fetched_at == ~U[2025-11-07 08:46:00Z]
    end

    test "create_metric/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Crypto.create_metric(@invalid_attrs)
    end

    test "update_metric/2 with valid data updates the metric" do
      metric = metric_fixture()
      update_attrs = %{difficulty: 456.7, hashrate: 456.7, btc_price: 456.7, fetched_at: ~U[2025-11-08 08:46:00Z]}

      assert {:ok, %Metric{} = metric} = Crypto.update_metric(metric, update_attrs)
      assert metric.difficulty == 456.7
      assert metric.hashrate == 456.7
      assert metric.btc_price == 456.7
      assert metric.fetched_at == ~U[2025-11-08 08:46:00Z]
    end

    test "update_metric/2 with invalid data returns error changeset" do
      metric = metric_fixture()
      assert {:error, %Ecto.Changeset{}} = Crypto.update_metric(metric, @invalid_attrs)
      assert metric == Crypto.get_metric!(metric.id)
    end

    test "delete_metric/1 deletes the metric" do
      metric = metric_fixture()
      assert {:ok, %Metric{}} = Crypto.delete_metric(metric)
      assert_raise Ecto.NoResultsError, fn -> Crypto.get_metric!(metric.id) end
    end

    test "change_metric/1 returns a metric changeset" do
      metric = metric_fixture()
      assert %Ecto.Changeset{} = Crypto.change_metric(metric)
    end
  end
end
