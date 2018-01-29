defmodule TigerhoodApiWeb.MessageView do
    use TigerhoodApiWeb, :view
    alias TigerhoodApiWeb.MessageView
  
    def render("index.json", %{messages: messages}) do
      render_many(messages, MessageView, "message.json")
    end
  
    def render("show.json", %{message: message}) do
      render_one(message, MessageView, "message.json")
    end
  
    def render("message.json", %{message: message}) do
      %{author: message.author,
      content: message.content}
    end
  end
  