defmodule VersionWarehouse.Repo.Migrations.AddVersionCreatedAtToVersions do
  use Ecto.Migration

  def change do
    alter table(:versions) do
      add :version_created_at, :utc_datetime
    end
  end
end
