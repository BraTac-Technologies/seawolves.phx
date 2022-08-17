defmodule Wolves.Repo.Migrations.CreateEventMatch do
  use Ecto.Migration

  def change do
      create table(:event_match) do
        add(:event_id, references(:events, on_delete: :delete_all))
        add(:match_id, references(:matches, on_delete: :delete_all))
        timestamps()
      end

    create unique_index(:event_match, [:event_id, :match_id], name: :event_match_unique_index)
  end
end
