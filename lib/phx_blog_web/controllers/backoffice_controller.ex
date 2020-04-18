defmodule PhxBlogWeb.BackofficeController do
  use PhxBlogWeb, :controller
  use PhxBlogWeb.CurrentUser

  plug :put_layout, "backoffice.html"

  def index(conn, _params, current_user) do
    render(conn, "index.html", logged_in: current_user)
  end
end
