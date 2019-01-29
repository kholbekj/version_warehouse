defmodule VersionWarehouse.Repo.Migrations.AddTrigramIndexToVersionsObject do
  use Ecto.Migration
  @disable_ddl_transaction true

  def up do
    execute('DROP INDEX IF EXISTS versions_trgm_idx')
    execute('CREATE EXTENSION IF NOT EXISTS pg_trgm')
    execute("CREATE INDEX CONCURRENTLY versions_trgm_idx ON versions USING GIN (to_tsvector('english', object))")
  end

  def down do
    execute('DROP INDEX IF EXISTS versions_trgm_idx')
    execute('DROP EXTENSION IF EXISTS pg_trgm')
  end
end
