defmodule TigerhoodApi.Repo.Migrations.MessagesBelongToTiger do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      add :tiger_id, references(:tigers)
    end
  end
end
