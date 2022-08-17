defmodule Wolves.EventMatch do
  @moduledoc """
  The PlayerTour context.
  """
  import Ecto.Query, warn: false
  alias Wolves.Repo
  alias Wolves.Events.EventMatch

  @doc """
  Returns the list of player_tour.
  """

  def toggle_event_match(event_id, match_id) do
    query = from(em in EventMatch, where: em.event_id == ^event_id and em.match_id == ^match_id )
    assoc = Repo.one(query)
    # require IEx; IEx.pry
    if assoc == nil do
      %EventMatch{}
      |> EventMatch.changeset(%{event_id: event_id, match_id: match_id})
      |> Repo.insert()
    else
      Repo.delete(assoc)
    end
  end

end
