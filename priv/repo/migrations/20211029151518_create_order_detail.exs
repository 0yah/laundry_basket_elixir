defmodule LaundryBasket.Repo.Migrations.CreateOrderDetail do
  use Ecto.Migration

  def change do
    create table(:details) do
      add :order, references(:orders)
      add :item, references(:items)
      add :quantity, :integer

      timestamps()
    end
  end
end
