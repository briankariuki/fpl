defmodule Fpl.Entry do
  @moduledoc """
  The FPL Entry module
  """

  import Fpl.Client

  alias Fpl.Types.Entry
  alias Fpl.Types.EntryLeagues
  alias Fpl.Types.EntryLeague
  alias Fpl.Types.EntryLeaguePhase
  alias Fpl.Types.EntryCup
  alias Fpl.Types.EntryCupStatus
  alias Fpl.Types.EntryCupMatch
  alias Fpl.Types.EntryHistory
  alias Fpl.Types.EntryHistoryPast
  alias Fpl.Types.EntryHistoryEvent
  alias Fpl.Types.EntryHistoryChip
  alias Fpl.Types.EntryPicks
  alias Fpl.Types.EntryPick
  alias Fpl.Types.EntryPicksAutoSub
  alias Fpl.Types.EntryTransfer

  @entry_url "/entry/"

  @doc """
  Fetches the entry data from FPL Api
  """
  def get_entry(entry_id) do
    get(
      client(),
      @entry_url <> entry_id <> "/"
    )
    |> format_response(
      decode_as: %Entry{
        leagues: %EntryLeagues{
          classic: [
            %EntryLeague{
              active_phases: [%EntryLeaguePhase{}]
            }
          ],
          h2h: [
            %EntryLeague{
              active_phases: [%EntryLeaguePhase{}]
            }
          ],
          cup: %EntryCup{
            status: %EntryCupStatus{},
            matches: [%EntryCupMatch{}]
          }
        }
      }
    )
  end

  @doc """
  Fetches the entry's history data from FPL Api
  """
  def get_entry_history(entry_id) do
    get(
      client(),
      @entry_url <> entry_id <> "/history/"
    )
    |> format_response(
      decode_as: %EntryHistory{
        past: [%EntryHistoryPast{}],
        current: [%EntryHistoryEvent{}],
        chips: [%EntryHistoryChip{}]
      }
    )
  end

  @doc """
  Fetches the entry's picks data from FPL Api
  """
  def get_entry_picks(entry_id, event_id) do
    get(
      client(),
      @entry_url <> entry_id <> "/event/" <> event_id <> "/picks/"
    )
    |> format_response(
      decode_as: %EntryPicks{
        picks: [%EntryPick{}],
        entry_history: %EntryHistoryEvent{},
        automatic_subs: [%EntryPicksAutoSub{}]
      }
    )
  end

  @doc """
  Fetches the entry's transfers data from FPL Api
  """
  def get_entry_transfers(entry_id) do
    get(
      client(),
      @entry_url <> entry_id <> "/transfers/"
    )
    |> format_response(decode_as: [%EntryTransfer{}])
  end
end
