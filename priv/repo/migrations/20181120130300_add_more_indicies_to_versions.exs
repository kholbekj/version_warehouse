defmodule VersionWarehouse.Repo.Migrations.AddMoreIndiciesToVersions do
  use Ecto.Migration
  @disable_ddl_transaction true

  def change do
    create index(
      :versions,
      [:item_type, :event, :created_at],
      concurrently: true
    )
  end
end
