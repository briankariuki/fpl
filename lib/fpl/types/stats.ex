defmodule Fpl.Types.MostValuableTeam do
  @moduledoc """
  The Fpl Most Valuable Team
  """

  @enforce_keys []
  @fields quote(
            do: [
              entry: integer(),
              name: String.t(),
              player_name: String.t(),
              total_transfers: integer(),
              value_with_bank: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.BestClassicLeague do
  @moduledoc """
  The Fpl Best Classic League
  """

  @enforce_keys []
  @fields quote(
            do: [
              league: integer(),
              entries: integer(),
              average_score: String.t(),
              name: String.t()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.TopPlayer do
  @moduledoc """
  The Fpl Top Player
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

defmodule Fpl.Types.DreamTeamElement do
  @moduledoc """
  The Fpl Dream Team Element
  """

  @enforce_keys []
  @fields quote(
            do: [
              element: integer(),
              position: integer(),
              points: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.DreamTeam do
  @moduledoc """
  The Fpl Dream Team
  """

  @enforce_keys []
  @fields quote(
            do: [
              top_player: Fpl.Types.TopPlayer.t(),
              team: [Fpl.Types.DreamTeamElement.t()]
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end
