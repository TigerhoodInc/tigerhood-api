defmodule TigerhoodApiWeb.TigerControllerTest do
  use TigerhoodApiWeb.ConnCase

  alias TigerhoodApi.Tigers
  alias TigerhoodApi.Tigers.Tiger

  @create_attrs %{image: "some image", name: "some name"}
  @update_attrs %{image: "some updated image", name: "some updated name"}
  @invalid_attrs %{image: nil, name: nil}

  def fixture(:tiger) do
    {:ok, tiger} = Tigers.create_tiger(@create_attrs)
    tiger
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tigers", %{conn: conn} do
      conn = get conn, tiger_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tiger" do
    test "renders tiger when data is valid", %{conn: conn} do
      conn = post conn, tiger_path(conn, :create), tiger: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, tiger_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "image" => "some image",
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tiger_path(conn, :create), tiger: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tiger" do
    setup [:create_tiger]

    test "renders tiger when data is valid", %{conn: conn, tiger: %Tiger{id: id} = tiger} do
      conn = put conn, tiger_path(conn, :update, tiger), tiger: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, tiger_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "image" => "some updated image",
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, tiger: tiger} do
      conn = put conn, tiger_path(conn, :update, tiger), tiger: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tiger" do
    setup [:create_tiger]

    test "deletes chosen tiger", %{conn: conn, tiger: tiger} do
      conn = delete conn, tiger_path(conn, :delete, tiger)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, tiger_path(conn, :show, tiger)
      end
    end
  end

  defp create_tiger(_) do
    tiger = fixture(:tiger)
    {:ok, tiger: tiger}
  end
end
