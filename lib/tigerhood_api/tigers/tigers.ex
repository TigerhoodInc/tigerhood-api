defmodule TigerhoodApi.Tigers do
  @moduledoc """
  The Tigers context.
  """

  import Ecto.Query, warn: false
  alias TigerhoodApi.Repo

  alias TigerhoodApi.Tigers.Tiger

  @doc """
  Returns the list of tigers.

  ## Examples

      iex> list_tigers()
      [%Tiger{}, ...]

  """
  def list_tigers do
    Repo.all(Tiger) |> Repo.preload(:messages)
  end

  @doc """
  Gets a single tiger.

  Raises `Ecto.NoResultsError` if the Tiger does not exist.

  ## Examples

      iex> get_tiger!(123)
      %Tiger{}

      iex> get_tiger!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tiger!(id), do: Repo.get!(Tiger, id)

  @doc """
  Creates a tiger.

  ## Examples

      iex> create_tiger(%{field: value})
      {:ok, %Tiger{}}

      iex> create_tiger(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tiger(attrs \\ %{}) do
    %Tiger{}
    |> Tiger.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tiger.

  ## Examples

      iex> update_tiger(tiger, %{field: new_value})
      {:ok, %Tiger{}}

      iex> update_tiger(tiger, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tiger(%Tiger{} = tiger, attrs) do
    tiger
    |> Tiger.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tiger.

  ## Examples

      iex> delete_tiger(tiger)
      {:ok, %Tiger{}}

      iex> delete_tiger(tiger)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tiger(%Tiger{} = tiger) do
    Repo.delete(tiger)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tiger changes.

  ## Examples

      iex> change_tiger(tiger)
      %Ecto.Changeset{source: %Tiger{}}

  """
  def change_tiger(%Tiger{} = tiger) do
    Tiger.changeset(tiger, %{})
  end
end
