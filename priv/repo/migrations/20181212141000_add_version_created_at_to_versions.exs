defmodule VersionWarehouse.Repo.Migrations.AddVersionCreatedAtToVersions do
  use Ecto.Migration

  def change do
    alter table(:versions) do
      add :version_created_at, :utc_datetime
    end

    create index(:versions, :version_created_at, concurrently: true)

    create index(
      :versions,
      [:item_type, :event, :version_created_at],
      concurrently: true
    )
  end
end
