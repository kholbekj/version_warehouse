defmodule VersionWarehouse.Repo.Migrations.CreateVersion do
  use Ecto.Migration

  def change do
    create table(:versions) do
      add :item_type, :string
      add :item_id, :integer
      add :event, :string
      add :whodunnit, :string
      add :object, :text
      add :ip, :string
      add :request_id, :string
      add :admin_id, :integer
      add :object_changes, :text

      timestamps
    end

  end
end
