defmodule Fpl.Types.GamePhase do
  @moduledoc """
  The Fpl Game Phase
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              name: String.t(),
              start_event: integer(),
              stop_event: integer(),
              highest_score: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.GameSettings do
  @moduledoc """
  The Fpl Game Settings
  """

  @enforce_keys []
  @fields quote(
            do: [
              league_join_private_max: integer(),
              league_join_public_max: integer(),
              league_max_ko_rounds_private_h2h: integer(),
              league_max_size_private_h2h: integer(),
              league_max_size_public_classic: integer(),
              league_max_size_public_h2h: integer(),
              league_points_h2h_draw: integer(),
              league_points_h2h_lose: integer(),
              league_points_h2h_win: integer(),
              league_prefix_public: String.t(),
              squad_squadplay: integer(),
              squad_squadsize: integer(),
              squad_team_limit: integer(),
              squad_total_spend: integer(),
              stats_form_days: integer(),
              sys_vice_captain_enabled: boolean(),
              timezone: String.t(),
              transfers_cap: integer(),
              transfers_sell_on_fee: integer(),
              max_extra_free_transfers: integer(),
              ui_currency_multiplier: integer(),
              ui_special_shirt_exclusions: any(),
              ui_use_special_shirts: boolean(),
              league_h2h_tiebreak_stats: {:array, String.t()},
              cup_start_event_id: integer() | nil,
              cup_stop_event_id: integer() | nil,
              cup_qualifying_method: nil,
              cup_type: nil,
              league_ko_first_instead_of_random: boolean(),
              featured_entries: {:array, any()},
              percentile_ranks: {:array, integer()}
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.BootstrapStatic do
  @moduledoc """
  The Fpl Bootstrap Static
  """

  @enforce_keys []
  @fields quote(
            do: [
              events: {:array, Fpl.Types.Event.t()},
              game_settings: Fpl.Types.GameSettings.t(),
              phases: {:array, Fpl.Types.GamePhase.t()},
              teams: {:array, Fpl.Types.Team.t()},
              elements: {:array, Fpl.Types.Element.t()},
              element_stats: {:array, Fpl.Types.ElementStat.t()},
              element_types: {:array, Fpl.Types.ElementType.t()},
              total_players: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end
