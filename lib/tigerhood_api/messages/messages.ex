defmodule TigerhoodApi.Messages do
  
  import Ecto.Query, warn: false
  alias TigerhoodApi.Repo

  alias TigerhoodApi.Messages.Message

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  def get_message!(id), do: Repo.get!(Message, id)

end
