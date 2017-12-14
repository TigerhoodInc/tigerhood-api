defmodule TigerhoodApi.Repo.Migrations.CreateTigers do
  use Ecto.Migration

  def change do
    create table(:tigers) do
      add :name, :string
      add :image, :string

      timestamps()
    end

  end
end
