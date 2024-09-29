defmodule Fpl.Client do
  @moduledoc """
  Fpl HTTP Client
  """

  use Tesla

  @timeout 600_000

  @base_url "https://fantasy.premierleague.com/api"

  @doc """
  Constructs the Tesla http client
  """
  def client(url \\ nil) do
    base_url = if is_nil(url), do: @base_url, else: url

    middleware = [
      {Tesla.Middleware.BaseUrl, base_url},
      Tesla.Middleware.JSON,
      Tesla.Middleware.Logger,
      Tesla.Middleware.Retry,
      {Tesla.Middleware.Headers,
       [
         {"origin", "https://fantasy.premierleague.com"},
         {"referer", "https://fantasy.premierleague.com"},
         {"user-agent",
          "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36"}
       ]}
    ]

    adapter = {Tesla.Adapter.Hackney, [recv_timeout: @timeout]}
    Tesla.client(middleware, adapter)
  end

  @doc """
  Formats the api response
  """
  def format_response(result, opts \\ []) do
    case result do
      {:ok, %{status: 200, body: body}} ->
        case Keyword.has_key?(opts, :decode_as) do
          true ->
            value = Poison.encode!(body)
            Poison.decode(value, %{as: opts[:decode_as]})

          _ ->
            {:ok, body}
        end

      error ->
        msg = parse_error(error)

        {:error, %{message: "Something went wrong. Request error", error: inspect(msg)}}
    end
  end

  defp parse_error({:error, :nxdomain}) do
    {:error, "network error"}
  end

  defp parse_error({:error, :connect_timeout}) do
    {:error, "network error. connection timeout"}
  end

  defp parse_error({:error, :closed}) do
    {:error, "network error. connection closed"}
  end

  defp parse_error({:ok, %{body: body}}) do
    body
    |> Map.get(
      "detail",
      "Something went wrong. request error. Please open an issue in the repository on github"
    )
  end

  defp parse_error(_) do
    {:error, "something went wrong. request error"}
  end
end
