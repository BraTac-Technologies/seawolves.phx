defmodule Wolves.Matches.Match do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wolves.Players.Player

  schema "matches" do

    belongs_to :player, Player
    field :result1, :integer
    field :result2, :integer
    field :rival_player, :string

    timestamps()
  end

  @doc false
  def changeset(match, attrs) do
    match
    |> cast(attrs, [:player_id, :rival_player, :result1, :result2])
    |> validate_required([:player_id, :rival_player, :result1, :result2])
  end
end
