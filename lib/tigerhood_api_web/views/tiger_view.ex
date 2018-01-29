defmodule TigerhoodApiWeb.TigerView do
  use TigerhoodApiWeb, :view
  alias TigerhoodApiWeb.TigerView

  def render("index.json", %{tigers: tigers}) do
    render_many(tigers, TigerView, "tiger.json")
  end

  def render("show.json", %{tiger: tiger}) do
    render_one(tiger, TigerView, "tiger.json")
  end

  def render("tiger.json", %{tiger: tiger}) do
    %{id: tiger.id,
      name: tiger.name,
      image: tiger.image,
      messages: TigerhoodApiWeb.MessageView.render("index.json", %{messages: tiger.messages})}
  end
end
