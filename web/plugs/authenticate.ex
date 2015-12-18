defmodule VersionWarehouse.Plugs.Authenticate do
  import Plug.Conn
  require Logger

  def init(options) do
    options
  end

  def call(conn, _) do
    [token | _] = Plug.Conn.get_req_header(conn,"token")
    token
    |> validate_token
    |> case do
      :ok ->
        conn
      _ ->
        conn
        |> send_resp(403, "Not authenticated")
        |> halt
    end
  end

  def validate_token(token) do
    auth_token = Application.get_env(:version_warehouse, :auth)[:auth_token]

    Logger.debug(String.length(token))
    case token do
      ^auth_token ->
        :ok
      _ ->
        :error
    end
  end
end
