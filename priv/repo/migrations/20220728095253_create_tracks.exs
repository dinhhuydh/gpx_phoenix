defmodule GpxPhoenix.Repo.Migrations.CreateTracks do
  use Ecto.Migration

  def change do
    create table(:tracks) do
      add :name, :string

      timestamps()
    end
    execute "CREATE EXTENSION IF NOT EXISTS postgis"
    execute("SELECT AddGeometryColumn('tracks', 'geom', 3857, 'MULTILINESTRINGZ', 3);")
  end
end
