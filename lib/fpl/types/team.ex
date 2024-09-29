defmodule Fpl.Types.Team do
  @moduledoc """
  The Fpl Team
  """

  @enforce_keys []
  @fields quote(
            do: [
              code: integer(),
              draw: integer(),
              form: String.t() | nil,
              id: integer(),
              loss: integer(),
              name: String.t(),
              played: integer(),
              points: integer(),
              position: integer(),
              short_name: String.t(),
              strength: integer(),
              team_division: String.t() | nil,
              unavailable: boolean(),
              win: integer(),
              strength_overall_home: integer(),
              strength_overall_away: integer(),
              strength_attack_home: integer(),
              strength_attack_away: integer(),
              strength_defence_home: integer(),
              strength_defence_away: integer(),
              pulse_id: integer()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end
