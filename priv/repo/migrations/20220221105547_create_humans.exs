defmodule RandompplApi.Repo.Migrations.CreateHumans do
  use Ecto.Migration

  def change do
    create table(:humans) do
      add :name, :string
      add :quote, :text
      add :avatar, :string
      add :role, :string

      timestamps()
    end
  end
end
