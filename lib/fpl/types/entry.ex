defmodule Fpl.Types.EntryCupMatch do
  @moduledoc """
  The Fpl Entry Cup Match
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              entry_1_entry: integer(),
              entry_1_name: String.t(),
              entry_1_player_name: String.t(),
              entry_1_points: integer(),
              entry_1_win: integer(),
              entry_1_draw: integer(),
              entry_1_loss: integer(),
              entry_1_total: integer(),
              entry_2_entry: integer(),
              entry_2_name: String.t(),
              entry_2_player_name: String.t(),
              entry_2_points: integer(),
              entry_2_win: integer(),
              entry_2_draw: integer(),
              entry_2_loss: integer(),
              entry_2_total: integer(),
              is_knockout: boolean(),
              winner: integer(),
              seed_value: nil,
              event: integer(),
              tiebreak: nil
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryCupStatus do
  @moduledoc """
  The Fpl Entry Cup Status
  """

  @enforce_keys []
  @fields quote(
            do: [
              qualification_event: integer() | nil,
              qualification_numbers: integer() | nil,
              qualification_rank: integer() | nil,
              qualification_state: String.t() | nil
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryCup do
  @moduledoc """
  The Fpl Entry Cup
  """

  @enforce_keys []
  @fields quote(
            do: [
              cup_league: nil,
              matches: {:array, Fpl.Types.EntryCupMatch.t()},
              status: Fpl.Types.EntryCupStatus.t()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryLeaguePhase do
  @moduledoc """
  The Fpl Entry League Phase
  """

  @enforce_keys []
  @fields quote(
            do: [
              total: integer(),
              league_id: integer(),
              phase: integer(),
              rank: integer() | nil,
              rank_count: integer() | nil,
              rank_sort: integer() | nil,
              last_rank: integer() | nil,
              entry_percentile_rank: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryLeague do
  @moduledoc """
  The Fpl Entry League
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              active_phases: {:array, Fpl.Types.EntryLeaguePhase.t()},
              cup_league: nil,
              cup_qualified: boolean() | nil,
              has_cup: boolean(),
              name: String.t(),
              short_name: String.t() | nil,
              league_type: String.t(),
              scoring: String.t(),
              created: String.t(),
              closed: boolean(),
              rank: integer() | nil,
              rank_count: integer() | nil,
              max_entries: integer() | nil,
              admin_entry: integer() | nil,
              start_event: integer(),
              entry_rank: integer(),
              entry_last_rank: integer(),
              entry_percentile_rank: integer(),
              entry_can_leave: boolean(),
              entry_can_admin: boolean(),
              entry_can_invite: boolean()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryLeagues do
  @moduledoc """
  The Fpl Entry Leagues
  """

  @enforce_keys []
  @fields quote(
            do: [
              classic: {:array, Fpl.Types.EntryLeague.t()},
              h2h: {:array, Fpl.Types.EntryLeague.t()},
              cup: Fpl.Types.EntryCup.t(),
              cup_matches: any()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryHistoryChip do
  @moduledoc """
  The Fpl Entry History Chip
  """

  @enforce_keys []
  @fields quote(
            do: [
              event: integer(),
              name: String.t(),
              time: String.t()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryHistoryPast do
  @moduledoc """
  The Fpl Entry History Past
  """

  @enforce_keys []
  @fields quote(
            do: [
              rank: integer(),
              season_name: String.t(),
              total_points: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryHistoryEvent do
  @moduledoc """
  The Fpl Entry History Event
  """

  @enforce_keys []
  @fields quote(
            do: [
              bank: integer(),
              event: integer(),
              event_transfers: integer(),
              event_transfers_cost: integer(),
              overall_rank: integer(),
              percentile_rank: integer(),
              points: integer(),
              points_on_bench: integer(),
              rank: integer(),
              rank_sort: integer(),
              total_points: integer(),
              value: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryHistory do
  @moduledoc """
  The Fpl Entry History
  """

  @enforce_keys []
  @fields quote(
            do: [
              chips: {:array, Fpl.Types.EntryHistoryChip.t()},
              current: {:array, Fpl.Types.EntryHistoryEvent.t()},
              past: {:array, Fpl.Types.EntryHistoryPast.t()}
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryPick do
  @moduledoc """
  The Fpl Entry Pick
  """

  @enforce_keys []
  @fields quote(
            do: [
              element: integer(),
              position: integer(),
              is_captain: boolean(),
              is_vice_captain: boolean(),
              multiplier: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryPicksAutoSub do
  @moduledoc """
  The Fpl Entry Picks Auto Sub
  """

  @enforce_keys []
  @fields quote(
            do: [
              element_in: integer(),
              element_out: integer(),
              entry: integer(),
              event: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryPicks do
  @moduledoc """
  The Fpl Entry Picks
  """

  @enforce_keys []
  @fields quote(
            do: [
              active_chip: String.t() | nil,
              automatic_subs: {:array, Fpl.Types.EntryPicksAutoSub.t()},
              entry_history: Fpl.Types.EntryHistoryEvent.t(),
              picks: {:array, Fpl.Types.EntryPick.t()}
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EntryTransfer do
  @moduledoc """
  The Fpl Entry Transfer
  """

  @enforce_keys []
  @fields quote(
            do: [
              element_in: integer(),
              element_in_cost: integer(),
              element_out: integer(),
              element_out_cost: integer(),
              entry: integer(),
              event: integer(),
              time: String.t()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.Entry do
  @moduledoc """
  The Fpl Entry
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              joined_time: String.t(),
              started_event: integer(),
              favourite_team: integer(),
              name: String.t(),
              name_change_blocked: boolean(),
              player_first_name: String.t(),
              player_last_name: String.t(),
              player_region_id: integer(),
              player_region_name: String.t(),
              player_region_iso_code_short: String.t(),
              player_region_iso_code_long: String.t(),
              summary_overall_points: integer() | nil,
              summary_overall_rank: integer() | nil,
              summary_event_points: integer() | nil,
              summary_event_rank: integer() | nil,
              current_event: integer() | nil,
              entered_events: {:array, integer()} | nil,
              kit: String.t() | nil,
              last_deadline_bank: integer() | nil,
              last_deadline_value: integer() | nil,
              last_deadline_total_transfers: integer(),
              years_active: integer(),
              leagues: Fpl.Types.EntryLeagues.t()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end
