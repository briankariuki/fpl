defmodule Fpl.Player do
  @moduledoc """
  The FPL Player module
  """

  import Fpl.Client

  alias Fpl.Types.ElementSummary
  alias Fpl.Types.ElementFixture
  alias Fpl.Types.ElementSeasonHistory
  alias Fpl.Types.ElementMatchStats

  @element_summary_url "/element-summary/"

  @doc """
  Fetches the player element summary data from FPL Api
  """
  def get_element_summary(element_id) do
    get(
      client(),
      @element_summary_url <> element_id <> "/"
    )
    |> format_response(
      decode_as: %ElementSummary{
        fixtures: [%ElementFixture{}],
        history: [%ElementMatchStats{}],
        history_past: [%ElementSeasonHistory{}]
      }
    )
  end
end
