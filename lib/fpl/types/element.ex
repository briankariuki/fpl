defmodule Fpl.Types.Element do
  @moduledoc """
  The Fpl Element
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              photo: String.t(),
              web_name: String.t(),
              team: String.t(),
              team_code: integer(),
              status: String.t(),
              code: integer(),
              first_name: String.t(),
              second_name: String.t(),
              squad_number: integer() | nil,
              news: String.t() | nil,
              news_added: String.t() | nil,
              now_cost: integer(),
              chance_of_playing_this_round: integer() | nil,
              chance_of_playing_next_round: integer() | nil,
              value_form: float(),
              value_season: float(),
              cost_change_start: integer(),
              cost_change_event: integer(),
              cost_change_start_fall: integer(),
              cost_change_event_fall: integer(),
              in_dreamteam: boolean(),
              dreamteam_count: integer(),
              selected_by_percent: float(),
              form: float(),
              transfers_out: integer(),
              transfers_in: integer(),
              transfers_out_event: integer(),
              transfers_in_event: integer(),
              loans_in: integer(),
              loans_out: integer(),
              loaned_in: integer(),
              loaned_out: integer(),
              total_points: integer(),
              event_points: integer(),
              points_per_game: float(),
              ep_this: float() | nil,
              ep_next: float() | nil,
              special: boolean(),
              minutes: integer(),
              goals_scored: integer(),
              assists: integer(),
              clean_sheets: integer(),
              goals_conceded: integer(),
              own_goals: integer(),
              penalties_saved: integer(),
              penalties_missed: integer(),
              yellow_cards: integer(),
              red_cards: integer(),
              saves: integer(),
              bonus: integer(),
              bps: integer(),
              influence: float(),
              creativity: float(),
              threat: float(),
              ict_index: float(),
              ea_index: float(),
              element_type: String.t(),
              starts: integer(),
              expected_goals: float(),
              expected_assists: float(),
              expected_goal_involvements: float(),
              expected_goals_conceded: float(),
              influence_rank: integer(),
              influence_rank_type: integer(),
              creativity_rank: integer(),
              creativity_rank_type: integer(),
              threat_rank: integer(),
              threat_rank_type: integer(),
              ict_index_rank: integer(),
              ict_index_rank_type: integer(),
              corners_and_indirect_freekicks_order: integer() | nil,
              corners_and_indirect_freekicks_text: String.t() | nil,
              direct_freekicks_order: integer() | nil,
              direct_freekicks_text: String.t() | nil,
              penalties_order: integer() | nil,
              penalties_text: String.t() | nil,
              expected_goals_per_90: float(),
              saves_per_90: float(),
              expected_assists_per_90: float(),
              expected_goal_involvements_per_90: float(),
              expected_goals_conceded_per_90: float(),
              goals_conceded_per_90: float(),
              now_cost_rank: integer(),
              now_cost_rank_type: integer(),
              form_rank: integer(),
              form_rank_type: integer(),
              points_per_game_rank: integer(),
              points_per_game_rank_type: integer(),
              selected_rank: integer(),
              selected_rank_type: integer(),
              starts_per_90: float(),
              clean_sheets_per_90: float()
            ]
          )
  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ElementStat do
  @moduledoc """
  The Fpl Element Stat
  """

  @enforce_keys []
  @fields quote(
            do: [
              label: String.t(),
              name: String.t()
            ]
          )

  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ElementType do
  @moduledoc """
  The Fpl Element Type
  """

  @enforce_keys []
  @fields quote(
            do: [
              element_count: integer(),
              id: integer(),
              plural_name: String.t(),
              plural_name_short: String.t(),
              singular_name: String.t(),
              singular_name_short: String.t(),
              squad_max_play: integer(),
              squad_max_select: integer() | nil,
              squad_min_play: integer(),
              squad_min_select: integer() | nil,
              squad_select: integer(),
              sub_positions_locked: {:array, integer()},
              ui_shirt_specific: boolean()
            ]
          )

  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ElementFixture do
  @moduledoc """
  The Fpl Element Fixture
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              kickoff_time_formatted: String.t(),
              event_name: String.t(),
              opponent_name: String.t(),
              opponent_short_name: String.t(),
              is_home: boolean(),
              difficulty: integer(),
              code: integer(),
              kickoff_time: String.t(),
              team_h_score: integer() | nil,
              team_a_score: integer() | nil,
              finished: boolean(),
              minutes: integer(),
              provisional_start_time: boolean(),
              finished_provisional: boolean(),
              event: integer() | nil,
              team_a: integer(),
              team_h: integer()
            ]
          )

  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ElementSeasonHistory do
  @moduledoc """
  The Fpl Element Season History
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              season_name: String.t(),
              element_code: integer(),
              is_home: boolean(),
              start_cost: integer(),
              end_cost: integer(),
              total_points: integer(),
              minutes: integer(),
              goals_scored: integer(),
              assists: integer(),
              clean_sheets: integer(),
              goals_conceded: integer(),
              own_goals: integer(),
              penalties_saved: integer(),
              penalties_missed: integer(),
              yellow_cards: integer(),
              red_cards: integer(),
              saves: integer(),
              bonus: integer(),
              bps: integer(),
              influence: float(),
              creativity: float(),
              threat: float(),
              ict_index: float(),
              ea_index: float(),
              expected_goals: float(),
              expected_assists: float(),
              expected_goal_involvements: float(),
              expected_goals_conceded: float()
            ]
          )

  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ElementMatchStats do
  @moduledoc """
  The Fpl Element Match Stats
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              kickoff_time: String.t(),
              kickoff_time_formatted: String.t(),
              team_h_score: integer() | nil,
              team_a_score: integer() | nil,
              was_home: boolean(),
              round: integer(),
              total_points: integer(),
              value: integer(),
              transfers_balance: integer(),
              selected: integer(),
              transfers_in: integer(),
              transfers_out: integer(),
              loaned_in: integer(),
              loaned_out: integer(),
              minutes: integer(),
              goals_scored: integer(),
              assists: integer(),
              clean_sheets: integer(),
              goals_conceded: integer(),
              own_goals: integer(),
              penalties_saved: integer(),
              penalties_missed: integer(),
              penalties_conceded: integer(),
              yellow_cards: integer(),
              red_cards: integer(),
              saves: integer(),
              bonus: integer(),
              bps: integer(),
              influence: float(),
              creativity: float(),
              threat: float(),
              ict_index: float(),
              ea_index: float(),
              open_play_crosses: integer(),
              big_chances_created: integer(),
              clearances_blocks_interceptions: integer(),
              recoveries: integer(),
              key_passes: integer(),
              tackles: integer(),
              winning_goals: integer(),
              attempted_passes: integer(),
              completed_passes: integer(),
              big_chances_missed: integer(),
              errors_leading_to_goal: integer(),
              errors_leading_to_goal_attempt: integer(),
              tackled: integer(),
              offside: integer(),
              target_missed: integer(),
              fouls: integer(),
              dribbles: integer(),
              element: integer(),
              fixture: integer(),
              opponent_team: integer(),
              expected_goals: float(),
              expected_assists: float(),
              expected_goal_involvements: float(),
              expected_goals_conceded: float(),
              starts: integer()
            ]
          )

  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ElementSummary do
  @moduledoc """
  The Fpl Element Summary
  """

  @enforce_keys []
  @fields quote(
            do: [
              history_past: {:array, Fpl.Types.ElementSeasonHistory.t()},
              fixtures: {:array, Fpl.Types.ElementFixture.t()},
              history: {:array, Fpl.Types.ElementMatchStats.t()}
            ]
          )

  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ElementExplainStat do
  @moduledoc """
  The Fpl Element Explain Stat
  """

  @enforce_keys []
  @fields quote(
            do: [
              identifier: String.t(),
              points: integer(),
              value: integer()
            ]
          )

  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ElementExplain do
  @moduledoc """
  The Fpl Element Explain
  """

  @enforce_keys []
  @fields quote(
            do: [
              fixture: integer(),
              stats: {:array, Fpl.Types.ElementExplainStat.t()}
            ]
          )

  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end

defmodule Fpl.Types.ElementLive do
  @moduledoc """
  The Fpl Element Live
  """

  @enforce_keys []
  @fields quote(
            do: [
              id: integer(),
              stats: Fpl.Types.ElementMatchStats.t(),
              explain: {:array, Fpl.Types.ElementExplain.t()}
            ]
          )

  @derive [Poison.Encoder]
  defstruct Keyword.keys(@fields)

  @type t() :: %__MODULE__{unquote_splicing(@fields)}
end
