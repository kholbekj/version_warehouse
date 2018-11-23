defmodule VersionWarehouse.Repo.Migrations.AddTrigramIndexToVersionsObject do
  use Ecto.Migration
  @disable_ddl_transaction true

  def up do
    execute("CREATE EXTENSION pg_trgm")

    execute("""
    CREATE INDEX versions_trgm_idx ON versions USING GIN (to_tsvector('english',
      object))
    """)
  end

  def down do
    execute('DROP INDEX versions_trgm_idx')
    execute("DROP EXTENSION pg_trgm")
  end
end
