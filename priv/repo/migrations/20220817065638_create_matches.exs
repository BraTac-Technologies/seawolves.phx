defmodule Wolves.Repo.Migrations.CreateMatches do
  use Ecto.Migration

  def change do
    create table(:matches) do
      add(:player_id, references(:players, on_delete: :delete_all))
      add :rival_player, :string
      add :result1, :integer
      add :result2, :integer

      timestamps()
    end
  end
end
