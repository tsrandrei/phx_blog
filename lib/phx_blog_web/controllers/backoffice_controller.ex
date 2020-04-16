defmodule PhxBlogWeb.BackofficeController do
  use PhxBlogWeb, :controller

  plug :put_layout, "backoffice.html"

  def index(conn, _params) do  
    render(conn, "index.html")
  end
end
