defmodule PhxBlog.Accounts.User do
  use Ecto.Schema
  use Pow.Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    pow_user_fields()

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :username, :email, :password_hash])
    |> validate_required([:email, :password_hash])
    |> unique_constraint([:email, :username])
  end
end
