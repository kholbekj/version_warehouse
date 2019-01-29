defmodule VersionWarehouse.Repo.Migrations.AddTrigramIndexToVersionsObject do
  use Ecto.Migration
  @disable_ddl_transaction true

  def up do
    execute("""
    CREATE INDEX CONCURRENTLY versions_trgm_idx ON versions USING GIN (to_tsvector('english',
      object))
    """)
  end

  def down do
    execute('DROP INDEX versions_trgm_idx')
  end
end
