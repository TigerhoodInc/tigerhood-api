defmodule TigerhoodApi.TigersTest do
  use TigerhoodApi.DataCase

  alias TigerhoodApi.Tigers

  describe "tigers" do
    alias TigerhoodApi.Tigers.Tiger

    @valid_attrs %{image: "some image", name: "some name"}
    @update_attrs %{image: "some updated image", name: "some updated name"}
    @invalid_attrs %{image: nil, name: nil}

    def tiger_fixture(attrs \\ %{}) do
      {:ok, tiger} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tigers.create_tiger()

      tiger
    end

    test "list_tigers/0 returns all tigers" do
      tiger = tiger_fixture()
      assert Tigers.list_tigers() == [tiger]
    end

    test "get_tiger!/1 returns the tiger with given id" do
      tiger = tiger_fixture()
      assert Tigers.get_tiger!(tiger.id) == tiger
    end

    test "create_tiger/1 with valid data creates a tiger" do
      assert {:ok, %Tiger{} = tiger} = Tigers.create_tiger(@valid_attrs)
      assert tiger.image == "some image"
      assert tiger.name == "some name"
    end

    test "create_tiger/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tigers.create_tiger(@invalid_attrs)
    end

    test "update_tiger/2 with valid data updates the tiger" do
      tiger = tiger_fixture()
      assert {:ok, tiger} = Tigers.update_tiger(tiger, @update_attrs)
      assert %Tiger{} = tiger
      assert tiger.image == "some updated image"
      assert tiger.name == "some updated name"
    end

    test "update_tiger/2 with invalid data returns error changeset" do
      tiger = tiger_fixture()
      assert {:error, %Ecto.Changeset{}} = Tigers.update_tiger(tiger, @invalid_attrs)
      assert tiger == Tigers.get_tiger!(tiger.id)
    end

    test "delete_tiger/1 deletes the tiger" do
      tiger = tiger_fixture()
      assert {:ok, %Tiger{}} = Tigers.delete_tiger(tiger)
      assert_raise Ecto.NoResultsError, fn -> Tigers.get_tiger!(tiger.id) end
    end

    test "change_tiger/1 returns a tiger changeset" do
      tiger = tiger_fixture()
      assert %Ecto.Changeset{} = Tigers.change_tiger(tiger)
    end
  end
end
