defmodule Fpl.Types.EventFixtureStatElement do
  @moduledoc """
  The Fpl Fixture Stats
  """

  @enforce_keys []
  @fields quote(
            do: [
              element: integer(),
              value: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EventFixtureStat do
  @moduledoc """
  The Fpl Fixture Stats
  """

  @enforce_keys []
  @fields quote(
            do: [
              identifier: String.t(),
              a: {:array, Fpl.Types.EventFixtureStatElement.t()},
              h: {:array, Fpl.Types.EventFixtureStatElement.t()}
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.EventFixture do
  @moduledoc """
  The Fpl Fixture
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              event: integer(),
              code: integer(),
              finished: boolean(),
              finished_provisional: boolean(),
              kickoff_time: String.t(),
              minutes: integer(),
              provisional_start_time: boolean() | nil,
              pulse_id: integer(),
              started: boolean(),
              stats: {:array, Fpl.Types.EventFixtureStat.t()},
              team_a: integer(),
              team_a_score: integer() | nil,
              team_a_difficulty: integer() | nil,
              team_h: integer(),
              team_h_score: integer() | nil,
              team_h_difficulty: integer() | nil
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end
