defmodule Fpl.Types.ClassicLeague do
  @moduledoc """
  The Fpl Classic League
  """

  @enforce_keys []
  @fields quote(
            do: [
              last_updated_data: String.t(),
              league: Fpl.Types.ClassicLeagueInfo.t(),
              new_entries: Fpl.Types.LeagueNewEntries.t(),
              standings: Fpl.Types.LeagueStandings.t()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.H2HLeague do
  @moduledoc """
  The Fpl H2H League
  """

  @enforce_keys []
  @fields quote(
            do: [
              last_updated_data: String.t(),
              league: Fpl.Types.H2HLeagueInfo.t(),
              new_entries: Fpl.Types.LeagueNewEntries.t(),
              standings: Fpl.Types.LeagueStandings.t()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ClassicLeagueInfo do
  @moduledoc """
  The Fpl Classic League Info
  """

  @enforce_keys []
  @fields quote(
            do: [
              admin_entry: integer() | nil,
              closed: boolean(),
              code_privacy: String.t(),
              created: String.t(),
              id: integer(),
              max_entries: integer() | nil,
              name: String.t(),
              rank: integer() | nil,
              start_event: integer(),
              scoring: String.t(),
              league_type: String.t(),
              has_cup: boolean(),
              cup_league: integer() | nil
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.H2HLeagueInfo do
  @moduledoc """
  The Fpl H2H League Info
  """

  @enforce_keys []
  @fields quote(
            do: [
              admin_entry: integer() | nil,
              closed: boolean(),
              code_privacy: String.t(),
              created: String.t(),
              id: integer(),
              max_entries: integer() | nil,
              name: String.t(),
              rank: integer() | nil,
              start_event: integer(),
              scoring: String.t(),
              league_type: String.t(),
              has_cup: boolean(),
              cup_league: integer() | nil,
              ko_rounds: integer() | nil
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.LeagueNewEntries do
  @moduledoc """
  The Fpl League New Entries
  """

  @enforce_keys []
  @fields quote(
            do: [
              has_next: boolean(),
              page: integer(),
              results: [Fpl.Types.LeagueNewEntry.t()]
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.LeagueNewEntry do
  @moduledoc """
  The Fpl League New Entry
  """

  @enforce_keys []
  @fields quote(
            do: [
              entry: integer(),
              entry_name: String.t(),
              joined_time: String.t(),
              player_first_name: String.t(),
              player_last_name: String.t()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.LeagueStandings do
  @moduledoc """
  The Fpl League New Entries
  """

  @enforce_keys []
  @fields quote(
            do: [
              has_next: boolean(),
              page: integer(),
              results: [Fpl.Types.LeagueEntry.t()]
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.LeagueEntry do
  @moduledoc """
  The Fpl League Entry
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              entry: integer(),
              entry_name: String.t(),
              event_total: integer(),
              player_name: String.t(),
              last_rank: integer(),
              rank: integer(),
              rank_sort: integer(),
              total: integer(),
              division: integer(),
              matches_drawn: integer(),
              matches_lost: integer(),
              matches_played: integer(),
              matches_won: integer(),
              points_for: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end
