defmodule PhxBlogWeb.Router do
  use PhxBlogWeb, :router

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


  scope "/", PhxBlogWeb do
    pipe_through :browser

    get "/backoffice", BackofficeController, :index
    get "/", PageController, :index
  end

  scope "/backoffice", PhxBlogWeb do
    pipe_through [:browser, :backoffice]

    resources "/users", UserController
    resources "/posts", PostController
  end

   # Other scopes may use custom stacks.
   scope "/api", PhxBlogWeb do
     pipe_through :api
   end
end
