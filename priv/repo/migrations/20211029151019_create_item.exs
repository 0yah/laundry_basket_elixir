defmodule LaundryBasket.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:item) do
      add :name, :string
      add :price, :string
      add :image_link, :string
    end
  end
end
