defmodule ConectarInfoBackend.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :ip, :string
      add :os, :string
      add :os_version, :string
      add :last_update, :date
      add :lat, :float
      add :lon, :float
      add :date, :date

      timestamps
    end

  end
end
