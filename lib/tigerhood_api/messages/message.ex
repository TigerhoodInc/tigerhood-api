defmodule TigerhoodApi.Messages.Message do
    use Ecto.Schema
    import Ecto.Changeset
    alias TigerhoodApi.Messages.Message
  
  
    schema "messages" do
        field :author, :string
        field :content, :string
        timestamps()
    end
  
    @doc false
    def changeset(%Message{} = message, attrs) do
      message
        |> cast(attrs, [:name, :image])
        |> validate_required([:name, :image])
    end
  end
  