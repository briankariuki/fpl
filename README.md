# Fpl

An Elixir wrapper for the unofficial `Fantasy Premier League` API.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fpl` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fpl, "~> 0.1.0"}
  ]
end
```

## Usage
In iex you can access base methods in the `Fpl` module. For example,

Get an entry's team for a given event

```elixir
iex> Fpl.get_entry_picks("1001", "1")

{:ok, %Fpl.Types.EntryPicks{
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
     %Fpl.Types.EntryPick{
       element: 333,
       position: 3,
       is_captain: false,
       is_vice_captain: false,
       multiplier: 1
     },
     ...
   ]
 }}
```
## Docs 

Documentation for the available methods can be found at [https://hexdocs.pm/fpl/0.1.0/Fpl.html](https://hexdocs.pm/fpl/0.1.0/Fpl.html)

