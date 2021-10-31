defmodule LaundryBasket.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :price, :float
    field :image_link, :string
    has_many :detail, LaundryBasket.Orders.Detail

    timestamps()
  end

  def changeset(item, params) do
    item
    |> cast(params, [:name, :price, :image_link])
    |> validate_required([:name, :price, :image_link])
    |> validate_number(:price, greater_than: 4)
  end
end
