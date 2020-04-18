defmodule PhxBlogWeb.Router do
  use PhxBlogWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :backoffice do
    plug :put_layout, {PhxBlogWeb.LayoutView, "backoffice.html"}
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  pipeline :pow_layout do
    plug :put_layout, {PhxBlogWeb.LayoutView, "login.html"}
  end


  scope "/backoffice" do
    pipe_through [:browser, :pow_layout]

    pow_routes()
  end

  scope "/", PhxBlogWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/backoffice", PhxBlogWeb do
    pipe_through [:browser, :backoffice, :protected]

    get "/", BackofficeController, :index
    resources "/users", UserController
    resources "/posts", PostController
  end

   # Other scopes may use custom stacks.
   scope "/api", PhxBlogWeb do
     pipe_through :api
   end
end
