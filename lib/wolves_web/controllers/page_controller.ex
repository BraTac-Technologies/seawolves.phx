defmodule WolvesWeb.PageController do
  use WolvesWeb, :controller

  alias Wolves.Events

  def index(conn, _params) do
    events = Events.list_events()
    render(conn, "index.html", events: events)
  end
end
