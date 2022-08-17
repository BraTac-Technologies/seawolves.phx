defmodule WolvesWeb.AdminLive do
  use WolvesWeb, :live_view


  alias Wolves.Events
  alias Wolves.Players
  alias Wolves.Matches
  alias Wolves.Repo
  alias WolvesWeb.AdminView
  alias Wolves.EventMatch

  def render(assigns) do
   render AdminView, "index.html", assigns
  end

  def mount(_params, _, socket) do
    events = Events.list_events()
    players = Players.list_players()
    matches = Matches.list_matches() |> Repo.preload(:player)
    socket = assign(
        socket,
        events: events,
        players: players,
        matches: matches
      )
    {:ok, socket}
  end

   def handle_event("match_event",
                    %{"event_id" => %{"event_id" => event_id},
                    "match_id" => %{"match_id" => match_id}},
                    socket) do

    EventMatch.toggle_event_match(event_id, match_id)

#    tour = socket.assigns[:tour]
 #             |> Repo.preload(:players)
 #   Events.toggle_tour_players(tour, player_id)
  #  tour_players = Events.tour_players(tour)
   #                |>Enum.map(fn(x) -> x.player_id end)


                   {:noreply, socket}
  end

end
