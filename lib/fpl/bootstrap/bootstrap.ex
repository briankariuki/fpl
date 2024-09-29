defmodule Fpl.Bootstrap do
  @moduledoc """
  The FPL Bootstrap module
  """

  import Fpl.Client

  alias Fpl.Types.BootstrapStatic
  alias Fpl.Types.Event
  alias Fpl.Types.EventChipPlay
  alias Fpl.Types.EventTopElementInfo
  alias Fpl.Types.GameSettings
  alias Fpl.Types.GamePhase
  alias Fpl.Types.Team
  alias Fpl.Types.Element
  alias Fpl.Types.ElementStat
  alias Fpl.Types.ElementType

  @bootstrap_static_url "/bootstrap-static/"
  @doc """
  Fetches the bootstrap static data from FPL Api
  """
  def get_bootstrap_static() do
    get(
      client(),
      @bootstrap_static_url
    )
    |> format_response(
      decode_as: %BootstrapStatic{
        events: [
          %Event{
            chip_plays: [%EventChipPlay{}],
            top_element_info: %EventTopElementInfo{}
          }
        ],
        game_settings: %GameSettings{},
        phases: [%GamePhase{}],
        teams: [%Team{}],
        elements: [%Element{}],
        element_stats: [%ElementStat{}],
        element_types: [%ElementType{}]
      }
    )
  end
end
