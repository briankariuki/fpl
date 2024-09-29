defmodule Fpl.League do
  @moduledoc """
  The FPL League module
  """

  import Fpl.Client

  alias Fpl.Types.ClassicLeague
  alias Fpl.Types.ClassicLeagueInfo
  alias Fpl.Types.LeagueNewEntries
  alias Fpl.Types.LeagueNewEntry
  alias Fpl.Types.LeagueEntry
  alias Fpl.Types.LeagueStandings

  @classic_league_url "/leagues-classic/"
  @h2h_league_url "/leagues-h2h/"

  @doc """
  Fetches a classic league and its standings by the given id and page from FPL Api
  """
  def get_classic_league(league_id, page) do
    get(
      client(),
      @classic_league_url <> league_id <> "/standings/?page_standings=" <> page
    )
    |> format_response(
      decode_as: %ClassicLeague{
        league: %ClassicLeagueInfo{},
        new_entries: %LeagueNewEntries{
          results: [%LeagueNewEntry{}]
        },
        standings: %LeagueStandings{
          results: [%LeagueEntry{}]
        }
      }
    )
  end

  @doc """
  Fetches a head to head league and its standings from FPL Api
  """
  def get_head_to_head_league(league_id, page) do
    get(
      client(),
      @h2h_league_url <> league_id <> "/standings/?page_standings=" <> page
    )
    |> format_response()
  end
end
