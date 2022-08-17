defmodule Wolves.Events.EventMatch do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wolves.Events.Event
  alias Wolves.Matches.Match

  schema "event_match" do

    belongs_to :event, Event
    belongs_to :match, Match

    timestamps()
  end

  @doc false

  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:event_id, :match_id])
    |> validate_required([:event_id, :match_id])
  end
end
