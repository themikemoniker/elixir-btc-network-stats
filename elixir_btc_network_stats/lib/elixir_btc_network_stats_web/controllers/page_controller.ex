defmodule ElixirBtcNetworkStatsWeb.PageController do
  use ElixirBtcNetworkStatsWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
