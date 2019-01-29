defmodule VersionWarehouse.Repo.Migrations.AddTrigramIndexToVersionsObject do
  use Ecto.Migration
  @disable_ddl_transaction true

  def up do
    CREATE EXTENSION pg_trgm IF NOT EXISTS
    execute("""
    CREATE INDEX CONCURRENTLY versions_object_trgm_idx ON versions USING GIN (to_tsvector('english',
      object))
    """)
  end

  def down do
    execute('DROP INDEX versions_object_trgm_idx')
    DROP EXTENSION pg_trgm IF EXISTS
  end
end
