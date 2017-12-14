defmodule TigerhoodApiWeb.TigerController do
  use TigerhoodApiWeb, :controller

  alias TigerhoodApi.Tigers
  alias TigerhoodApi.Tigers.Tiger

  action_fallback TigerhoodApiWeb.FallbackController

  def index(conn, _params) do
    tigers = Tigers.list_tigers()
    render(conn, "index.json", tigers: tigers)
  end

  def create(conn, tiger_params) do
    with {:ok, %Tiger{} = tiger} <- Tigers.create_tiger(tiger_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", tiger_path(conn, :show, tiger))
      |> render("show.json", tiger: tiger)
    end
  end

  def show(conn, %{"id" => id}) do
    tiger = Tigers.get_tiger!(id)
    render(conn, "show.json", tiger: tiger)
  end

  def update(conn, %{"id" => id, "tiger" => tiger_params}) do
    tiger = Tigers.get_tiger!(id)

    with {:ok, %Tiger{} = tiger} <- Tigers.update_tiger(tiger, tiger_params) do
      render(conn, "show.json", tiger: tiger)
    end
  end

  def delete(conn, %{"id" => id}) do
    tiger = Tigers.get_tiger!(id)
    with {:ok, %Tiger{}} <- Tigers.delete_tiger(tiger) do
      send_resp(conn, :no_content, "")
    end
  end
end
