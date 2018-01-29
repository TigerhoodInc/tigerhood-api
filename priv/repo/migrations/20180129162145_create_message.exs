defmodule TigerhoodApi.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :author, :string
      add :content, :string
    end
  end
end