defmodule LaundaryBaskey.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :price, :float
    field :image_link, :string

    timestamps()
  end

end
