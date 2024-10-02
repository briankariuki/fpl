defmodule Fpl do
  @moduledoc """
  An Elixir wrapper for the unofficial `Fantasy Premier League` API.

  Note that an `Event` refers to a `Gameweek`
  """

  alias Fpl.Bootstrap
  alias Fpl.Fixture
  alias Fpl.Player
  alias Fpl.Event
  alias Fpl.League
  alias Fpl.Entry
  alias Fpl.Stats
  alias Fpl.Types.ElementSummary
  alias Fpl.Types.EventFixture
  alias Fpl.Types.EventStatus
  alias Fpl.Types.EventLive
  alias Fpl.Types.ClassicLeague
  alias Fpl.Types.H2HLeague

  @doc """
  Fetches a summary of the data available.

  This includes:

    * A summary of all 38 events
    * The game’s settings
    * Basic information on all 20 PL teams
    * Total number of Fpl Users and overall chip usage
    * Basic information on all Premier League players
    * List of stats that Fpl keeps track of
    * The different Fpl positions

  ## Examples

      iex> Fpl.get_bootstrap_static()
      {:ok,
        %Fpl.Types.BootstrapStatic{
          events: [
            %Fpl.Types.Event{
              average_entry_score: 57,
              chip_plays: [
                %Fpl.Types.EventChipPlay{chip_name: "bboost", num_played: 144974},
                %Fpl.Types.EventChipPlay{chip_name: "3xc", num_played: 221430}
              ],
              data_checked: true,
              deadline_time: "2024-08-16T17:30:00Z",
              release_time: nil,
              deadline_time_epoch: 1723829400,
              deadline_time_game_offset: 0,
              finished: true,
              highest_score: 127,
              highest_scoring_entry: 3546234,
              id: 1,
              is_current: false,
              is_next: false,
              is_previous: false,
              most_captained: 351,
              most_selected: 401,
              most_transferred_in: 27,
              most_vice_captained: 351,
              name: "Gameweek 1",
              transfers_made: 0,
              cup_leagues_created: false,
              h2h_ko_matches_created: false,
              ranked_count: 8597356,
              top_element: 328,
              top_element_info: %Fpl.Types.EventTopElementInfo{id: 328, points: 14}
            },
            ...
          ],
          game_settings: %Fpl.Types.GameSettings{
            league_join_private_max: 30,
            league_join_public_max: 5,
            league_max_ko_rounds_private_h2h: 3,
            league_max_size_private_h2h: 16,
            league_max_size_public_classic: 20,
            league_max_size_public_h2h: 16,
            league_points_h2h_draw: 1,
            league_points_h2h_lose: 0,
            league_points_h2h_win: 3,
            league_prefix_public: "League",
            squad_squadplay: 11,
            squad_squadsize: 15,
            squad_team_limit: 3,
            squad_total_spend: 1000,
            stats_form_days: 30,
            sys_vice_captain_enabled: true,
            timezone: "UTC",
            transfers_cap: 20,
            transfers_sell_on_fee: 0.5,
            max_extra_free_transfers: 4,
            ui_currency_multiplier: 10,
            ui_special_shirt_exclusions: [],
            ui_use_special_shirts: false,
            league_h2h_tiebreak_stats: ["+goals_scored", "-goals_conceded"],
            cup_start_event_id: nil,
            cup_stop_event_id: nil,
            cup_qualifying_method: nil,
            cup_type: nil,
            league_ko_first_instead_of_random: false,
            featured_entries: [],
            percentile_ranks: [1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65,
              70, ...]
          },
          phases: [
            %Fpl.Types.GamePhase{
              id: 1,
              name: "Overall",
              start_event: 1,
              stop_event: 38,
              highest_score: 536
            },
            ...
          ],
          teams: [
            %Fpl.Types.Team{
              code: 3,
              draw: 0,
              form: nil,
              id: 1,
              loss: 0,
              name: "Arsenal",
              played: 0,
              points: 0,
              position: 0,
              short_name: "ARS",
              strength: 5,
              team_division: nil,
              unavailable: false,
              win: 0,
              strength_overall_home: 1350,
              strength_overall_away: 1380,
              strength_attack_home: 1370,
              strength_attack_away: 1370,
              strength_defence_home: 1330,
              strength_defence_away: 1390,
              pulse_id: 1
            },
            ...
          ],
          elements: [
            %Fpl.Types.Element{
              id: 1,
              photo: "438098.jpg",
              web_name: "Fábio Vieira",
              team: 1,
              team_code: 3,
              status: "u",
              code: 438098,
              first_name: "Fábio",
              second_name: "Ferreira Vieira",
              squad_number: nil,
              news: "Has joined Portuguese side FC Porto on loan for the 2024/25 season",
              news_added: "2024-08-29T11:06:25.241953Z",
              now_cost: 54,
              chance_of_playing_this_round: 0,
              chance_of_playing_next_round: 0,
              value_form: "0.0",
              value_season: "0.0",
              cost_change_start: -1,
              cost_change_event: 0,
              cost_change_start_fall: 1,
              cost_change_event_fall: 0,
              in_dreamteam: false,
              dreamteam_count: 0,
              selected_by_percent: "0.0",
              form: "0.0",
              transfers_out: 2588,
              transfers_in: 439,
              transfers_out_event: 49,
              transfers_in_event: 0,
              loans_in: nil,
              loans_out: nil,
              loaned_in: nil,
              loaned_out: nil,
              total_points: 0,
              event_points: 0,
              points_per_game: "0.0",
              ep_this: "0.0",
              ep_next: "0.0",
              special: false,
              minutes: 0,
              goals_scored: 0,
              assists: 0,
              ...
            },
            ...
          ],
          element_stats: [
            %Fpl.Types.ElementStat{label: "Minutes played", name: "minutes"},
            %Fpl.Types.ElementStat{label: "Goals scored", name: "goals_scored"},
            ...
          ],
          element_types: [
            %Fpl.Types.ElementType{
              element_count: 70,
              id: 1,
              plural_name: "Goalkeepers",
              plural_name_short: "GKP",
              singular_name: "Goalkeeper",
              singular_name_short: "GKP",
              squad_max_play: 1,
              squad_max_select: nil,
              squad_min_play: 1,
              squad_min_select: nil,
              squad_select: 2,
              sub_positions_locked: [],
              ui_shirt_specific: true
            },
            ...
          ],
          total_players: 10460730
        }}

  """
  @spec get_bootstrap_static() :: {:ok, Fpl.Types.BootstrapStatic.t()} | {:error, :any}
  def get_bootstrap_static() do
    Bootstrap.get_bootstrap_static()
  end

  @doc """
  Fetches all fixtures.

  Per match, it shows:
    * Goals
    * Assists
    * Cards
    * Saves
    * Pens missed
    * Bonus points
    * Own goals
    * Pens saved

  ## Examples

      iex> Fpl.get_fixtures()
      {:ok,
        [
          %Fpl.Types.EventFixture{
            id: 1,
            event: 1,
            code: 2444470,
            finished: true,
            finished_provisional: true,
            kickoff_time: "2024-08-16T19:00:00Z",
            minutes: 90,
            provisional_start_time: false,
            pulse_id: 115827,
            started: true,
            stats: [
              %Fpl.Types.EventFixtureStat{
                identifier: "goals_scored",
                a: [],
                h: [%Fpl.Types.EventFixtureStatElement{element: 389, value: 1}]
              },
              ...
            ],
            team_a: 9,
            team_a_score: 0,
            team_a_difficulty: 3,
            team_h: 14,
            team_h_score: 1,
            team_h_difficulty: 2
          },
          ...
        ]}

  """
  @spec get_fixtures() :: {:ok, [EventFixture.t()]} | {:error, :any}
  def get_fixtures() do
    Fixture.get_fixtures()
  end

  @doc """
  Fetches all fixtures for a given event

  ## Examples

      iex> Fpl.get_fixtures_by_event("4")
      {:ok,
        [
          %Fpl.Types.EventFixture{
            id: 38,
            event: 4,
            code: 2444507,
            finished: true,
            finished_provisional: true,
            kickoff_time: "2024-09-14T11:30:00Z",
            minutes: 90,
            provisional_start_time: false,
            pulse_id: 115864,
            started: true,
            stats: [
              %Fpl.Types.EventFixtureStat{
                identifier: "goals_scored",
                a: [
                  %Fpl.Types.EventFixtureStatElement{element: 372, value: 1},
                  %Fpl.Types.EventFixtureStatElement{element: 385, value: 1},
                  %Fpl.Types.EventFixtureStatElement{element: 593, value: 1}
                ],
                h: []
              },
              ...
            ],
            team_a: 14,
            team_a_score: 3,
            team_a_difficulty: 2,
            team_h: 17,
            team_h_score: 0,
            team_h_difficulty: 3
          },
        ]}

  """
  @spec get_fixtures_by_event(event_id :: String.t()) ::
          {:ok, [EventFixture.t()]} | {:error, :any}
  def get_fixtures_by_event(event_id) do
    Fixture.get_fixtures_by_event(event_id)
  end

  @doc """
  Fetches the player element summary data which comprises of  including past performance and upcoming fixtures.

  This includes:

  Remaining fixtures for the player, including:
    * Kickoff time
    * Event number
    * Home or Away
    * Difficulty

  Previous fixtures and performance, including:
    * Minutes played
    * Goals
    * Assists
    * Conceded
    * Cards
    * Bonus
    * Influence
    * Creativity
    * xG
    * xA
    * Value
    * Transfer delta for that event

  ## Examples

      iex> Fpl.get_element_summary("4")
      {:ok,
        %Fpl.Types.ElementSummary{
          history_past: [
            %Fpl.Types.ElementSeasonHistory{
              id: nil,
              season_name: "2020/21",
              element_code: 219847,
              is_home: nil,
              start_cost: 85,
              end_cost: 83,
              total_points: 91,
              minutes: 1512,
              goals_scored: 4,
              assists: 6,
              clean_sheets: 8,
              goals_conceded: 15,
              own_goals: 0,
              penalties_saved: 0,
              penalties_missed: 0,
              yellow_cards: 2,
              red_cards: 0,
              saves: 0,
              bonus: 3,
              bps: 268,
              influence: "325.0",
              creativity: "307.7",
              threat: "514.0",
              ict_index: "114.2",
              ea_index: nil,
              expected_goals: "0.00",
              expected_assists: "0.00",
              expected_goal_involvements: "0.00",
              expected_goals_conceded: "0.00"
            },
            ...
          ],
          fixtures: [
            %Fpl.Types.ElementFixture{
              id: 61,
              kickoff_time_formatted: nil,
              event_name: "Gameweek 7",
              opponent_name: nil,
              opponent_short_name: nil,
              is_home: true,
              difficulty: 2,
              code: 2444530,
              kickoff_time: "2024-10-05T14:00:00Z",
              team_h_score: nil,
              team_a_score: nil,
              finished: false,
              minutes: 0,
              provisional_start_time: false,
              finished_provisional: nil,
              event: 7,
              team_a: 17,
              team_h: 1
            },
            ...
          ],
          history: [
            %Fpl.Types.ElementMatchStats{
              id: nil,
              kickoff_time: "2024-08-17T14:00:00Z",
              kickoff_time_formatted: nil,
              team_h_score: 2,
              team_a_score: 0,
              was_home: true,
              round: 1,
              total_points: 12,
              value: 80,
              transfers_balance: 0,
              selected: 1087445,
              transfers_in: 0,
              transfers_out: 0,
              loaned_in: nil,
              loaned_out: nil,
              minutes: 90,
              goals_scored: 1,
              assists: 1,
              clean_sheets: 1,
              goals_conceded: 0,
              own_goals: 0,
              penalties_saved: 0,
              penalties_missed: 0,
              penalties_conceded: nil,
              yellow_cards: 0,
              red_cards: 0,
              saves: 0,
              bonus: 3,
              bps: 48,
              influence: "54.8",
              creativity: "24.1",
              threat: "46.0",
              ict_index: "12.5",
              ea_index: nil,
              open_play_crosses: nil,
              big_chances_created: nil,
              clearances_blocks_interceptions: nil,
              recoveries: nil,
              key_passes: nil,
              tackles: nil,
              winning_goals: nil,
              attempted_passes: nil,
              completed_passes: nil,
              big_chances_missed: nil,
              ...
            },
            ...
          ]
        }}

  """
  @spec get_element_summary(element_id :: String.t()) ::
          {:ok, ElementSummary.t()} | {:error, :any}
  def get_element_summary(element_id) do
    Player.get_element_summary(element_id)
  end

  @doc """
  Fetches the current event's status

  ## Examples

      iex> Fpl.get_event_status()
      {:ok,
        %Fpl.Types.EventStatus{
          leagues: "Updated",
          status: [
            %Fpl.Types.EventStatusDay{
              bonus_added: true,
              date: "2024-09-28",
              event: 6,
              points: "r"
            },
            ...
          ]
        }}

  """

  @spec get_event_status() ::
          {:ok, EventStatus.t()} | {:error, :any}
  def get_event_status() do
    Event.get_event_status()
  end

  @doc """
  Fetches the event's live data.

  This endpoint shows all data similar to `Fpl.get_element_summary/1` but for the event for every player, rather than a single player for every event.

  ## Examples

      iex> Fpl.get_event_live("7")
      {:ok,
        %Fpl.Types.EventLive{
          elements: [
            %Fpl.Types.ElementLive{
              id: 1,
              stats: %Fpl.Types.ElementMatchStats{
                id: nil,
                kickoff_time: nil,
                kickoff_time_formatted: nil,
                team_h_score: nil,
                team_a_score: nil,
                was_home: nil,
                round: nil,
                total_points: 0,
                value: nil,
                transfers_balance: nil,
                selected: nil,
                transfers_in: nil,
                transfers_out: nil,
                loaned_in: nil,
                loaned_out: nil,
                minutes: 0,
                goals_scored: 0,
                assists: 0,
                clean_sheets: 0,
                goals_conceded: 0,
                own_goals: 0,
                penalties_saved: 0,
                penalties_missed: 0,
                penalties_conceded: nil,
                yellow_cards: 0,
                red_cards: 0,
                saves: 0,
                bonus: 0,
                bps: 0,
                influence: "0.0",
                creativity: "0.0",
                threat: "0.0",
                ict_index: "0.0",
                ea_index: nil,
                open_play_crosses: nil,
                big_chances_created: nil,
                clearances_blocks_interceptions: nil,
                recoveries: nil,
                key_passes: nil,
                tackles: nil,
                winning_goals: nil,
                attempted_passes: nil,
                completed_passes: nil,
                big_chances_missed: nil,
                ...
              },
              explain: [
                %Fpl.Types.ElementExplain{
                  fixture: 51,
                  stats: [
                    %Fpl.Types.ElementExplainStat{
                      identifier: "minutes",
                      points: 0,
                      value: 0
                    }
                  ]
                }
              ]
            },
            ...
          ]
        }}

  """
  @spec get_event_live(event_id :: String.t()) ::
          {:ok, EventLive.t()} | {:error, :any}
  def get_event_live(event_id) do
    Event.get_event_live(event_id)
  end

  @doc """
  Fetches the classic league's data which includes the entrys within the league, showing their relative ranking and high level data for each and is paginated.

  This includes:

  * League name
  * Date created
  * Admin ID
  * Closed or open
  * Cup activated

  Individual entry/team data, including:
    * Manager name
    * Team name
    * Current league rank
    * Last week’s rank
    * Entry ID
    * Total Points

  ## Examples

      iex> Fpl.get_classic_league("7", "1")
      {:ok,
        %Fpl.Types.ClassicLeague{
          last_updated_data: "2024-09-30T22:00:00Z",
          league: %Fpl.Types.ClassicLeagueInfo{
            admin_entry: nil,
            closed: false,
            code_privacy: "p",
            created: "2024-07-17T11:51:46.295853Z",
            id: 7,
            max_entries: nil,
            name: "Crystal Palace",
            rank: nil,
            start_event: 1,
            scoring: "c",
            league_type: "s",
            has_cup: true,
            cup_league: nil
          },
          new_entries: %Fpl.Types.LeagueNewEntries{
            has_next: false,
            page: 1,
            results: []
          },
          standings: %Fpl.Types.LeagueStandings{
            has_next: true,
            page: 1,
            results: [
              %Fpl.Types.LeagueEntry{
                id: 66695239,
                entry: 7871356,
                entry_name: "s.e.s.e.k.l.eb11@gma",
                event_total: 92,
                player_name: "Rede Ssddd",
                last_rank: 106,
                rank: 1,
                rank_sort: 1,
                total: 483,
                division: nil,
                matches_drawn: nil,
                matches_lost: nil,
                matches_played: nil,
                matches_won: nil,
                points_for: nil
              },
              ...
            ]
          }
        }}

  """
  @spec get_classic_league(league_id :: String.t(), page :: String.t()) ::
          {:ok, ClassicLeague.t()} | {:error, :any}
  def get_classic_league(league_id, page) do
    League.get_classic_league(league_id, page)
  end

  @doc """
  Fetches the head-to-head league's data which includes the entrys within the league, showing their relative ranking and high level data for each.

  This includes:

  * New entries
  * Last updated data

  League:
    * ID
    * Name
    * Created date
    * Closed
    * Max entries
    * League type
    * Scoring type
    * Start event
    * Privacy setting
    * Has cup
    * Cup league
    * Cup round

  Standings for each player, with:
    * ID
    * Division
    * Entry
    * Player name
    * Rank
    * Last rank
    * Rank sort
    * Total points
    * Team name
    * Played
    * Won
    * Drawn
    * Lost
    * Fpl Points

  ## Examples

      iex> Fpl.get_head_to_head_league("51", "1")
      {:ok, league}

  """
  @deprecated "Head to head leagues are no longer available from the 24/25 season."
  @spec get_head_to_head_league(league_id :: String.t(), page :: String.t()) ::
          {:ok, H2HLeague.t()} | {:error, :any}
  def get_head_to_head_league(league_id, page) do
    League.get_head_to_head_league(league_id, page)
  end

  @doc """
  Fetches information on any individual Fpl entry using their id.

  This includes:

  * Name
  * Team Name
  * Favourite team
  * Event started
  * Points
  * Transfers
  * Overall Rank
  * Last event rank
  * Last event points

  All league information, including:
    * Max entries
    * Scoring type
    * Cup qualification
    * Rank within the league
    * League name
    * Date created

  ## Examples

      iex> Fpl.get_entry("1001")
      {:ok,
        %Fpl.Types.Entry{
          id: 1001,
          joined_time: "2024-07-17T13:30:22.508934Z",
          started_event: 1,
          favourite_team: 12,
          name: "Long Hwang",
          name_change_blocked: false,
          player_first_name: "Jamie",
          player_last_name: "Malone",
          player_region_id: 241,
          player_region_name: "England",
          player_region_iso_code_short: "EN",
          player_region_iso_code_long: "ENG",
          summary_overall_points: 374,
          summary_overall_rank: 2605592,
          summary_event_points: 41,
          summary_event_rank: 7082049,
          current_event: 6,
          entered_events: [1, 2, 3, 4, 5, 6],
          kit: "{\"kit_shirt_type\":\"plain\",\"kit_shirt_base\":\"#E1E1E1\",\"kit_shirt_sleeves\":\"#E1E1E1\",\"kit_shirt_secondary\":\"#E1E1E1\",\"kit_shirt_logo\":\"none\",\"kit_shorts\":\"#E1E1E1\",\"kit_socks_type\":\"plain\",\"kit_socks_base\":\"#E1E1E1\",\"kit_socks_secondary\":\"#E1E1E1\"}",
          last_deadline_bank: 1,
          last_deadline_value: 1010,
          last_deadline_total_transfers: 3,
          years_active: 13,
          leagues: %Fpl.Types.EntryLeagues{
            classic: [
              %Fpl.Types.EntryLeague{
                id: 12,
                active_phases: [
                  %Fpl.Types.EntryLeaguePhase{
                    total: 374,
                    league_id: 12,
                    phase: 1,
                    rank: 500422,
                    rank_count: 1803727,
                    rank_sort: 501924,
                    last_rank: 325732,
                    entry_percentile_rank: 30
                  },
                  %Fpl.Types.EntryLeaguePhase{
                    total: 161,
                    league_id: 12,
                    phase: 3,
                    rank: 734319,
                    rank_count: 1803725,
                    rank_sort: 736322,
                    last_rank: 385518,
                    entry_percentile_rank: 45
                  }
                ],
                cup_league: nil,
                cup_qualified: nil,
                has_cup: true,
                name: "Liverpool",
                short_name: "team-12",
                league_type: "s",
                scoring: "c",
                created: "2024-07-17T11:51:46.332200Z",
                closed: false,
                rank: nil,
                rank_count: 1803727,
                max_entries: nil,
                admin_entry: nil,
                start_event: 1,
                entry_rank: 500422,
                entry_last_rank: 325732,
                entry_percentile_rank: 30,
                entry_can_leave: false,
                entry_can_admin: false,
                entry_can_invite: false
              },
              ...
            ],
            h2h: [],
            cup: %Fpl.Types.EntryCup{
              cup_league: nil,
              matches: [],
              status: %Fpl.Types.EntryCupStatus{
                qualification_event: nil,
                qualification_numbers: nil,
                qualification_rank: nil,
                qualification_state: nil
              }
            },
            cup_matches: []
          }
        }}
  """

  @spec get_entry(entry_id :: String.t()) ::
          {:ok, Fpl.Types.Entry.t()} | {:error, :any}
  def get_entry(entry_id) do
    Entry.get_entry(entry_id)
  end

  @doc """
  Fetches high level stats for each event gone by, plus the entry’s overall career performance form previous seasons.

  This includes:

  Event-by-event data, including:
    * Points
    * Rank
    * Overall rank
    * Money in the Bank
    * Team value
    * Transfers made
    * Chips played

  Past season history data, including:
    * Season year
    * Overall points
    * Overall rank

  ## Examples

      iex> Fpl.get_entry_history("1001")
      {:ok,
        %Fpl.Types.EntryHistory{
          chips: [
            %Fpl.Types.EntryHistoryChip{
              event: 6,
              name: "wildcard",
              time: "2024-09-23T21:51:05.823668Z"
            }
          ],
          current: [
            %Fpl.Types.EntryHistoryEvent{
              bank: 0,
              event: 1,
              event_transfers: 0,
              event_transfers_cost: 0,
              overall_rank: 3608219,
              percentile_rank: 45,
              points: 60,
              points_on_bench: 2,
              rank: 3608218,
              rank_sort: 3608260,
              total_points: 60,
              value: 1000
            },
            ...
          ],
          past: [
            %Fpl.Types.EntryHistoryPast{
              rank: 745491,
              season_name: "2011/12",
              total_points: 1817
            },
            ...
          ]
        }}

  """
  @spec get_entry_history(entry_id :: String.t()) ::
          {:ok, Fpl.Types.EntryHistory.t()} | {:error, :any}
  def get_entry_history(entry_id) do
    Entry.get_entry_history(entry_id)
  end

  @doc """
  Fetches the entry's details of 15 players for a given event.

  This includes:

  The general info for the event, such as:
    * Points
    * Total points
    * Rank
    * Team value
    * Money in the bank
    * Transfers made that event

  The stats of the individual players in the team, including:
    * Element ID (cross reference with bootstrap-static data)
    * Whether they’re captain or vice captain
    * Position in the team

  ## Examples

      iex> Fpl.get_entry_picks("1001", "1")
      {:ok,
        %Fpl.Types.EntryPicks{
          active_chip: nil,
          automatic_subs: [],
          entry_history: %Fpl.Types.EntryHistoryEvent{
            bank: 0,
            event: 1,
            event_transfers: 0,
            event_transfers_cost: 0,
            overall_rank: 3608219,
            percentile_rank: 45,
            points: 60,
            points_on_bench: 2,
            rank: 3608218,
            rank_sort: 3608260,
            total_points: 60,
            value: 1000
          },
          picks: [
            %Fpl.Types.EntryPick{
              element: 201,
              position: 1,
              is_captain: false,
              is_vice_captain: true,
              multiplier: 1
            },
            ...
          ]
        }}

  """
  @spec get_entry_picks(entry_id :: String.t(), event_id :: String.t()) ::
          {:ok, Fpl.Types.EntryPicks.t()} | {:error, :any}

  def get_entry_picks(entry_id, event_id) do
    Entry.get_entry_picks(entry_id, event_id)
  end

  @doc """
  Fetches the entry's full history of transfers.

  This includes:

  * Cost
  * Event
  * Time of transfer
  * Players in and out

  ## Examples

      iex> Fpl.get_entry_transfers("1001")
      {:ok,
        [
          %Fpl.Types.EntryTransfer{
            element_in: 310,
            element_in_cost: 55,
            element_out: 15,
            element_out_cost: 56,
            entry: 1001,
            event: 6,
            time: "2024-09-28T09:56:53.897045Z"
          },
          ...
        ]}

  """
  @spec get_entry_transfers(entry_id :: String.t()) ::
          {:ok, [Fpl.Types.EntryTransfer.t()]} | {:error, :any}

  def get_entry_transfers(entry_id) do
    Entry.get_entry_transfers(entry_id)
  end

  @doc """
  Fetches the most valuable entry teams.

  This includes:

  * Entry id
  * Entry team name
  * Entry name
  * Total transfers
  * Entry team value with money in the bank

  ## Examples

      iex> Fpl.get_most_valuable_teams()

      {:ok,
        [
          %Fpl.Types.MostValuableTeam{
            entry: 748498,
            name: "Stark",
            player_name: "Tark Chaikitti",
            total_transfers: 5,
            value_with_bank: 1036
          },
          %Fpl.Types.MostValuableTeam{
            entry: 965250,
            name: "Leoliu Monthly Team",
            player_name: "leo chandra",
            total_transfers: 26,
            value_with_bank: 1036
          },
          ...
        ]}

  """
  @spec get_most_valuable_teams() ::
          {:ok, [Fpl.Types.MostValuableTeam.t()]} | {:error, :any}

  def get_most_valuable_teams() do
    Stats.get_most_valuable_teams()
  end

  @doc """
  Fetches the best private classic leagues.

  This includes:

  * League id
  * League name
  * Number of entries
  * Average score

  ## Examples

      iex> Fpl.get_best_classic_leagues()

      {:ok,
        [
          %Fpl.Types.BestClassicLeague{
            league: 16505,
            entries: 68728,
            average_score: "509.4",
            name: "🇵🇸 Fantasawy 🇵🇸"
          },
          %Fpl.Types.BestClassicLeague{
            league: 16128,
            entries: 59237,
            average_score: "506.0",
            name: "ALLABOUTFPL"
          },
          ...
        ]}

  """
  @spec get_best_classic_leagues() ::
          {:ok, [Fpl.Types.BestClassicLeague.t()]} | {:error, :any}

  def get_best_classic_leagues() do
    Stats.get_best_classic_leagues()
  end

  @doc """
  Fetches the dream team for the given event.

  This includes:

  * Top player
  * Top elements in the team

  ## Examples

      iex> Fpl.get_dream_team("6")

      {:ok,
        %Fpl.Types.DreamTeam{
          top_player: %Fpl.Types.TopPlayer{id: 182, points: 25},
          team: [
            %Fpl.Types.DreamTeamElement{element: 508, position: 1, points: 6},
            %Fpl.Types.DreamTeamElement{element: 295, position: 2, points: 12},
            %Fpl.Types.DreamTeamElement{element: 506, position: 3, points: 11},
            %Fpl.Types.DreamTeamElement{element: 200, position: 4, points: 9},
            %Fpl.Types.DreamTeamElement{element: 182, position: 5, points: 25},
            %Fpl.Types.DreamTeamElement{element: 230, position: 6, points: 15},
            %Fpl.Types.DreamTeamElement{element: 9, position: 7, points: 13},
            %Fpl.Types.DreamTeamElement{element: 115, position: 8, points: 12},
            %Fpl.Types.DreamTeamElement{element: 23, position: 9, points: 12},
            %Fpl.Types.DreamTeamElement{element: 268, position: 10, points: 12},
            %Fpl.Types.DreamTeamElement{element: 58, position: 11, points: 11}
          ]
        }}

  """
  @spec get_dream_team(event_id :: String.t()) ::
          {:ok, Fpl.Types.DreamTeam.t()} | {:error, :any}

  def get_dream_team(event_id) do
    Stats.get_dream_team(event_id)
  end
end
