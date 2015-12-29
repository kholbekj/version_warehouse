defmodule VersionWarehouse.Repo.Migrations.ChangeCreatedAtToString do
  use Ecto.Migration

  def change do
    alter table(:versions) do
      modify :created_at, :string
    end
  end
end
