defmodule Fpl.Event do
  @moduledoc """
  The FPL Event module
  """

  import Fpl.Client

  alias Fpl.Types.EventStatus
  alias Fpl.Types.EventStatusDay
  alias Fpl.Types.EventLive
  alias Fpl.Types.ElementLive
  alias Fpl.Types.ElementMatchStats
  alias Fpl.Types.ElementExplain
  alias Fpl.Types.ElementExplainStat

  @event_status_url "/event-status/"
  @event_live_url "/event/"

  @doc """
  Fetches the current event's status from FPL Api
  """
  def get_event_status() do
    get(
      client(),
      @event_status_url
    )
    |> format_response(
      decode_as: %EventStatus{
        status: [%EventStatusDay{}]
      }
    )
  end

  @doc """
  Fetches the event's live data from FPL Api
  """
  def get_event_live(event_id) do
    get(
      client(),
      @event_live_url <> event_id <> "/live/"
    )
    |> format_response(
      decode_as: %EventLive{
        elements: [
          %ElementLive{
            stats: %ElementMatchStats{},
            explain: [
              %ElementExplain{
                stats: [%ElementExplainStat{}]
              }
            ]
          }
        ]
      }
    )
  end
end
