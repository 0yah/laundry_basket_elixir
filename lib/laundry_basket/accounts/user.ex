defmodule LaundryBasket.Accounts.User do

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :second_name, :string
    field :email, :string
    field :phone, :string

    timestamps()
  end

end
