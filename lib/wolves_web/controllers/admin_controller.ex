defmodule WolvesWeb.AdminController do
  use WolvesWeb, :controller

  alias Wolves.Events
  alias Wolves.Players
  alias Wolves.Matches
  alias Wolves.Repo

  def index(conn, _params) do
    events = Events.list_events()
    players = Players.list_players()
    matches = Matches.list_matches() |> Repo.preload(:player)
    render(conn, "index.html", events: events, players: players, matches: matches)
  end
end
