defmodule VersionWarehouse.Repo.Migrations.AddCreatedAtToVersions do
  use Ecto.Migration

  def change do
    alter table(:versions) do
      add :created_at, :datetime
    end
  end
end
