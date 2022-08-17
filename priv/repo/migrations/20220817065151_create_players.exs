defmodule Wolves.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :status, :string

      timestamps()
    end
  end
end
