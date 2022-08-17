defmodule Wolves.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :rival, :string
      add :status, :string
      add :date, :naive_datetime
      add :result1, :integer
      add :result2, :integer

      timestamps()
    end
  end
end
