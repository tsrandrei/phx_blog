defmodule PhxBlog.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :subtitle, :string
    field :title, :string
    field :body, :string
    field :author, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    # excluding Author by educational purpose
    post
    |> cast(attrs, [:title, :subtitle, :body])
    |> validate_required([:title, :subtitle, :body])
  end
end
