defmodule Fpl.Stats do
  @moduledoc """
  The FPL Stats module
  """

  import Fpl.Client

  alias Fpl.Types.MostValuableTeam
  alias Fpl.Types.BestClassicLeague
  alias Fpl.Types.DreamTeam
  alias Fpl.Types.DreamTeamElement
  alias Fpl.Types.TopPlayer

  @stats_url "/stats/"
  @dream_team_url "/dream-team/"

  @doc """
  Fetches the most valuable teams from FPL Api
  """
  def get_most_valuable_teams() do
    get(
      client(),
      @stats_url <> "most-valuable-teams/"
    )
    |> format_response(decode_as: [%MostValuableTeam{}])
  end

  @doc """
  Fetches the best private classic leagues from FPL Api
  """
  def get_best_classic_leagues() do
    get(
      client(),
      @stats_url <> "best-classic-private-leagues/"
    )
    |> format_response(decode_as: [%BestClassicLeague{}])
  end

  @doc """
  Fetches the dream team for the given event from FPL Api
  """
  def get_dream_team(event_id) do
    get(
      client(),
      @dream_team_url <> event_id <> "/"
    )
    |> format_response(
      decode_as: %DreamTeam{
        team: [%DreamTeamElement{}],
        top_player: %TopPlayer{}
      }
    )
  end
end
