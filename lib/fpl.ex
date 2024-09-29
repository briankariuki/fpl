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

  This data includes:

    * A summary of all 38 events
    * The game’s settings
    * Basic information on all 20 PL teams
    * Total number of Fpl Users and overall chip usage
    * Basic information on all Premier League players
    * List of stats that Fpl keeps track of
    * The different Fpl positions

  ## Examples

      iex> Fpl.get_bootstrap_static()
      {:ok, data}

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
      {:ok, fixtures}

  """
  @spec get_fixtures() :: {:ok, [EventFixture.t()]} | {:error, :any}
  def get_fixtures() do
    Fixture.get_fixtures()
  end

  @doc """
  Fetches all fixtures for a given event

  ## Examples

      iex> Fpl.get_fixtures_by_event("4")
      {:ok, fixtures}

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
      {:ok, element}

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
      {:ok, event}

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
      {:ok, event}

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
      {:ok, league}

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
  @spec get_head_to_head_league(league_id :: String.t(), page :: String.t()) ::
          {:ok, H2HLeague.t()} | {:error, :any}
  def get_head_to_head_league(league_id, page) do
    League.get_head_to_head_league(league_id, page)
  end

  @doc """
  Fetches information on any individual Fpl entry using their id.

  This data includes:

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
      {:ok, entry}
  """

  @spec get_entry(entry_id :: String.t()) ::
          {:ok, Fpl.Types.Entry.t()} | {:error, :any}
  def get_entry(entry_id) do
    Entry.get_entry(entry_id)
  end

  @doc """
  Fetches high level stats for each event gone by, plus the entry’s overall career performance form previous seasons.

  This data includes:

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
      {:ok, entry}

  """
  @spec get_entry_history(entry_id :: String.t()) ::
          {:ok, Fpl.Types.EntryHistory.t()} | {:error, :any}
  def get_entry_history(entry_id) do
    Entry.get_entry_history(entry_id)
  end

  @doc """
  Fetches the entry's details of 15 players for a given event.

  This data includes:

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
      {:ok, picks}

  """
  @spec get_entry_picks(entry_id :: String.t(), event_id :: String.t()) ::
          {:ok, Fpl.Types.EntryPicks.t()} | {:error, :any}

  def get_entry_picks(entry_id, event_id) do
    Entry.get_entry_picks(entry_id, event_id)
  end

  @doc """
  Fetches the entry's full history of transfers.

  This data includes:

  * Cost
  * Event
  * Time of transfer
  * Players in and out

  ## Examples

      iex> Fpl.get_entry_transfers("1001")
      {:ok, transfers}

  """
  @spec get_entry_transfers(entry_id :: String.t()) ::
          {:ok, [Fpl.Types.EntryTransfer.t()]} | {:error, :any}

  def get_entry_transfers(entry_id) do
    Entry.get_entry_transfers(entry_id)
  end

  @doc """
  Fetches the most valuable entry teams. This data includes:

  * Entry id
  * Entry team name
  * Entry name
  * Total transfers
  * Entry team value with money in the bank

  ## Examples

      iex> Fpl.get_most_valuable_teams()
      {:ok, teams}

  """
  @spec get_most_valuable_teams() ::
          {:ok, [Fpl.Types.MostValuableTeam.t()]} | {:error, :any}

  def get_most_valuable_teams() do
    Stats.get_most_valuable_teams()
  end

  @doc """
  Fetches the best private classic leagues. This data includes:

  * League id
  * League name
  * Number of entries
  * Average score

  ## Examples

      iex> Fpl.get_best_classic_leagues()
      {:ok, leagues}

  """
  @spec get_best_classic_leagues() ::
          {:ok, [Fpl.Types.BestClassicLeague.t()]} | {:error, :any}

  def get_best_classic_leagues() do
    Stats.get_best_classic_leagues()
  end

  @doc """
  Fetches the dream team for the given event.

  This data includes:

  * Top player
  * Top elements in the team

  ## Examples

      iex> Fpl.get_dream_team("6")
      {:ok, dream_team}

  """
  @spec get_dream_team(event_id :: String.t()) ::
          {:ok, Fpl.Types.DreamTeam.t()} | {:error, :any}

  def get_dream_team(event_id) do
    Stats.get_dream_team(event_id)
  end
end
