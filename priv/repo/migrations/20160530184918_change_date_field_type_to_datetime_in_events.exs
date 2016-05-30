defmodule ConectarInfoBackend.Repo.Migrations.ChangeDateFieldTypeToDatetimeInEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      modify :date, :datetime
    end
  end
end
