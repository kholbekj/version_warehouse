defmodule VersionWarehouse.Repo.Migrations.AddIndiciesToVersions do
  use Ecto.Migration

  def change do
    create index(:versions, [:item_type, :item_id])
  end
end
