defmodule PhxBlog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :subtitle, :string
      add :body, :string
      add :author, :string

      timestamps()
    end

  end
end
