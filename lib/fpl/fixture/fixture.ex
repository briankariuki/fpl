defmodule Fpl.Fixture do
  @moduledoc """
  The FPL Fixture module
  """

  import Fpl.Client

  alias Fpl.Types.EventFixture
  alias Fpl.Types.EventFixtureStat
  alias Fpl.Types.EventFixtureStatElement

  @fixtures_url "/fixtures/"

  @doc """
  Fetches all fixtures from FPL Api
  """
  def get_fixtures() do
    get(
      client(),
      @fixtures_url
    )
    |> format_response(
      decode_as: [
        %EventFixture{
          stats: [
            %EventFixtureStat{
              a: [%EventFixtureStatElement{}],
              h: [%EventFixtureStatElement{}]
            }
          ]
        }
      ]
    )
  end

  @doc """
  Fetches the fixtures from the given event from FPL Api
  """
  def get_fixtures_by_event(event_id) do
    get(
      client(),
      @fixtures_url <> "?event=" <> event_id
    )
    |> format_response(
      decode_as: [
        %EventFixture{
          stats: [
            %EventFixtureStat{
              a: [%EventFixtureStatElement{}],
              h: [%EventFixtureStatElement{}]
            }
          ]
        }
      ]
    )
  end
end
