defmodule VersionWarehouse.Repo.Migrations.AddVersionCreatedAtToVersions do
  use Ecto.Migration

  def change do
    alter table(:versions) do
      add :version_created_at, :utc_datetime
    end

    execute """
      UPDATE versions
      SET version_created_at = timezone('UTC', created_at::timestamptz)
      WHERE version_created_at IS NULL
      AND created_at IS NOT NULL
    """
  end
end
