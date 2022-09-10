defmodule WolvesWeb.PageController do
  use WolvesWeb, :controller

  alias Wolves.Events
  alias Wolves.Matches

  def index(conn, _params) do
    all_events = Events.list_events()
    length = length(all_events)
    length_for_first_col = trunc(Float.round(length / 2))
    length_for_second_col = length - length_for_first_col
    events_first_col = Events.list_events_first_col(length_for_first_col)
    events_second_col = Events.list_events_second_col(length_for_second_col)

    matches = Matches.list_matches()
    won_matches = Matches.list_matches_with_status_of_win()
    won_events = Events.list_events_with_status_of_win()
    render(conn, "index.html", events: all_events, events_first_col: events_first_col, events_second_col: events_second_col, matches: matches, won_matches: won_matches, won_events: won_events)
  end
end
