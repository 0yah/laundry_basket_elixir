defmodule LaundryBasket.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :status, :string
    field :price, :float
    field :delivery_date, :utc_datetime
    field :pickup_date, :utc_datetime
    belongs_to :user, LaundryBasket.Accounts.User
    belongs_to :pickup_rider, LaundryBasket.Accounts.Rider, foreign_key: :pickup_rider_id
    belongs_to :delivery_rider, LaundryBasket.Accounts.Rider, foreign_key: :delivery_rider_id
    belongs_to :location, LaundryBasket.Location
    has_many :details, LaundryBasket.Orders.Detail

    timestamps()
  end


end
