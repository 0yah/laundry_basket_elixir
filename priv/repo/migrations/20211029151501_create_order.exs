defmodule LaundryBasket.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :status, :string
      add :price, :float
      add :customer, references(:users)
      add :location, references(:locations)
      add :pickup_rider, references(:riders)
      add :delivery_rider, references(:riders)
      add :pickup_date, :utc_datetime
      add :delivery_date, :utc_datetime

      timestamps()
    end
  end
end
