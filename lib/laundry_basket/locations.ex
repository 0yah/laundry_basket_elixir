defmodule LaundryBaskey.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :floor, :string
    field :street, :string
    field :apt, :string
    field :longitude, :float
    field :latitude, :float
    has_many :orders, LaundryBasket.Order

    timestamps()
  end

end
