defmodule Wolves.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :date, :naive_datetime
    field :result1, :integer
    field :result2, :integer
    field :rival, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:rival, :status, :date, :result1, :result2])
    |> validate_required([:rival, :status, :date, :result1, :result2])
  end
end
