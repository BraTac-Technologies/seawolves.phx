defmodule WolvesWeb.PageController do
  use WolvesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
