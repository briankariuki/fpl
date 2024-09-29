defmodule Fpl.Types.EventStatusDay do
  @moduledoc """
  The Fpl Event Status
  """

  @enforce_keys []
  @fields quote(
            do: [
              bonus_added: boolean(),
              date: String.t(),
              event: integer(),
              points: String.t()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EventStatus do
  @moduledoc """
  The Fpl Event Status
  """

  @enforce_keys []
  @fields quote(
            do: [
              leagues: String.t(),
              status: {:array, Fpl.Types.EventStatusDay.t()}
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EventLive do
  @moduledoc """
  The Fpl Event Live
  """

  @enforce_keys []
  @fields quote(
            do: [
              elements: {:array, Fpl.Types.ElementLive.t()}
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EventChipPlay do
  @moduledoc """
  The Fpl Event Chip Play
  """

  @enforce_keys []
  @fields quote(
            do: [
              chip_name: String.t(),
              num_played: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EventTopElementInfo do
  @moduledoc """
  The Fpl Event Top Element Info
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              points: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.Event do
  @moduledoc """
  The Fpl Event
  """

  @enforce_keys []
  @fields quote(
            do: [
              average_entry_score: integer(),
              chip_plays: {:array, Fpl.Types.EventChipPlay.t()},
              data_checked: boolean(),
              deadline_time: String.t(),
              release_time: String.t() | nil,
              deadline_time_epoch: integer(),
              deadline_time_game_offset: integer(),
              finished: boolean(),
              highest_score: integer() | nil,
              highest_scoring_entry: integer() | nil,
              id: integer(),
              is_current: boolean(),
              is_next: boolean(),
              is_previous: boolean(),
              most_captained: integer() | nil,
              most_selected: integer() | nil,
              most_transferred_in: integer() | nil,
              most_vice_captained: integer() | nil,
              name: String.t(),
              transfers_made: integer(),
              cup_leagues_created: boolean(),
              h2h_ko_matches_created: boolean(),
              ranked_count: integer() | nil,
              top_element: integer() | nil,
              top_element_info: Fpl.Types.EventTopElementInfo.t() | nil
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end
