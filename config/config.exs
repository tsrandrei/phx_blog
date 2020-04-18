# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_blog,
  ecto_repos: [PhxBlog.Repo]

config :phx_blog, :pow,
    user: PhxBlog.Accounts.User,
    repo: PhxBlog.Repo,
    web_module: PhxBlogWeb

# Configures the endpoint
config :phx_blog, PhxBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Th8lJ8hUUvH1pK7Pg0872YHA0roG7EitKg9W21LgBzX2D1ewSCwJ0qopR925MBVS",
  render_errors: [view: PhxBlogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxBlog.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "fr0kquNV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
