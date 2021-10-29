defmodule LaundryBasket.Accounts.User do

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :second_name, :string
    field :email, :string
    field :phone, :string
    has_many :orders, LaundryBasket.Order
    has_one :rider, LaundryBasket.Accounts.Rider


    timestamps()
  end

end
