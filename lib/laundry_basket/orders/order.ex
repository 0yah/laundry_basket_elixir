defmodule LaundryBasket.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :status, :string
    field :price, :float
    field :delivery_date, :utc_datetime
    field :pickup_date, :utc_datetime
    belongs_to :user, LaundryBasket.Accounts.User
    belongs_to :pickup_rider, LaundryBasket.Accounts.Rider
    belongs_to :delivery_rider, LaundryBasket.Accounts.Rider

  end


end
