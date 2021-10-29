defmodule LaundryBasket.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :price, :float
      add :image_link, :string

      timestamps()
    end

    create unique_index(:items, [:name])
  end
end
