defmodule VersionWarehouse.Repo.Migrations.AddTrigramIndexToVersionsObject do
  use Ecto.Migration
  @disable_ddl_transaction true

  def up do
    execute("CREATE EXTENSION pg_trgm IF NOT EXISTS")
    
    execute("""
      CREATE INDEX CONCURRENTLY versions_trgm_idx
      ON versions
      USING GIN (to_tsvector('english', object))
      IF NOT EXISTS
    """)
  end

  def down do
    execute('DROP INDEX versions_trgm_idx IF EXISTS')
    execute("DROP EXTENSION pg_trgm IF EXISTS")
  end
end
