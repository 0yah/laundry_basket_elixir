defmodule LaundryBasket.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :floor, :string
      add :street, :string
      add :apt, :string
      add :longitude, :float
      add :latitude, :float

      timestamps()
    end
  end
end
