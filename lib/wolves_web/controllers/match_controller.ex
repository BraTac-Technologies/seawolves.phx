defmodule WolvesWeb.MatchController do
  use WolvesWeb, :controller

  alias Wolves.Matches
  alias Wolves.Matches.Match
  alias Wolves.Players

  def index(conn, _params) do
    matches = Matches.list_matches()
    render(conn, "index.html", matches: matches)
  end

  def new(conn, _params) do
    changeset = Matches.change_match(%Match{})
    players = Players.list_players()
    render(conn, "new.html", changeset: changeset, players: players)
  end

  def create(conn, %{"match" => match_params}) do
    case Matches.create_match(match_params) do
      {:ok, match} ->
        conn
        |> put_flash(:info, "Match created successfully.")
        |> redirect(to: Routes.match_path(conn, :show, match))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    match = Matches.get_match!(id)
    players = Players.list_players()
    render(conn, "show.html", match: match, players: players)
  end

  def edit(conn, %{"id" => id}) do
    match = Matches.get_match!(id)
    players = Players.list_players()
    changeset = Matches.change_match(match)
    render(conn, "edit.html", match: match, changeset: changeset, players: players)
  end

  def update(conn, %{"id" => id, "match" => match_params}) do
    match = Matches.get_match!(id)

    case Matches.update_match(match, match_params) do
      {:ok, match} ->
        conn
        |> put_flash(:info, "Match updated successfully.")
        |> redirect(to: Routes.match_path(conn, :show, match))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", match: match, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    match = Matches.get_match!(id)
    {:ok, _match} = Matches.delete_match(match)

    conn
    |> put_flash(:info, "Match deleted successfully.")
    |> redirect(to: Routes.match_path(conn, :index))
  end
end
