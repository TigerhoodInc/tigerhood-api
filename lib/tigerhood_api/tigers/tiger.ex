defmodule TigerhoodApi.Tigers.Tiger do
  use Ecto.Schema
  import Ecto.Changeset
  alias TigerhoodApi.Tigers.Tiger
  alias TigerhoodApi.Repo


  schema "tigers" do
    field :image, :string
    field :name, :string
    has_many :messages, TigerhoodApi.Messages.Message

    timestamps()
  end

  @doc false
  def changeset(%Tiger{} = tiger, attrs) do
    tiger
    |> cast(attrs, [:name, :image])
    |> validate_required([:name, :image])
  end
end
