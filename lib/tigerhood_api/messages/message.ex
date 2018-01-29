defmodule TigerhoodApi.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias TigerhoodApi.Messages.Message
  
  
  schema "messages" do
    field :author, :string
    field :content, :string
    belongs_to :tiger, TigerhoodApi.Tigers.Tiger

    timestamps()
  end
  
  @doc false
  def changeset(%Message{} = message, attrs) do
    message
      |> cast(attrs, [:author, :content])
      |> validate_required([:author, :content])
  end
end
  