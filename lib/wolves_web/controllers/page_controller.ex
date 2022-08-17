defmodule WolvesWeb.PageController do
  use WolvesWeb, :controller

  alias Wolves.Events
  alias Wolves.Matches

  def index(conn, _params) do
    events = Events.list_events()
    matches = Matches.list_matches()
    won_matches = Matches.list_matches_with_status_of_win()
    render(conn, "index.html", events: events, matches: matches, won_matches: won_matches)
  end
end
