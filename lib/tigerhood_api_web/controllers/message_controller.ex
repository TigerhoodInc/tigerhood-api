defmodule TigerhoodApiWeb.MessageController do
  use TigerhoodApiWeb, :controller
  
  alias TigerhoodApi.Messages
  alias TigerhoodApi.Messages.Message
  
  action_fallback TigerhoodApiWeb.FallbackController
  
  def create(conn, message_params) do
    with {:ok, %Message{} = message} <- Messages.create_message(message_params) do
      conn
        |> put_status(:created)
        |> put_resp_header("location", message_path(conn, :show, message))
        |> render("show.json", message: message)
    end
  end

  def show(conn, %{"id" => id}) do
    message = Messages.get_message!(id)
    render(conn, "show.json", message: message)
  end
end
  