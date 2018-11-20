defmodule VersionWarehouse.Repo.Migrations.AddMoreIndiciesToVersions do
  use Ecto.Migration

  def change do
    create index(
      :versions,
      [:item_type, :event, :created_at],
      concurrently: true
    )
  end
end
