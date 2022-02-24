defmodule RandompplApi.Directory.Human do
  use Ecto.Schema
  import Ecto.Changeset

  schema "humans" do
    field :avatar, :string
    field :name, :string
    field :quote, :string
    field :role, :string

    timestamps()
  end

  @doc false
  def changeset(human, attrs) do
    human
    |> cast(attrs, [:name, :quote, :avatar, :role])
    |> validate_required([:name, :quote, :avatar, :role])
  end
end
