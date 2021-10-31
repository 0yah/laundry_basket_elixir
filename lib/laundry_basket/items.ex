defmodule LaundryBasket.Items do

  import Ecto.Query, warn: false
  alias LaundryBasket.Items.Item
  alias LaundryBasket.Repo

  def list_items do
    items = Repo.all(Item)
    items
  end

  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert!()
  end

  def get_item!(id), do: Repo.get!(Item, id)

  def delete_item(%Item{} = item) do
    Repo.delete!(item)
  end

  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update!()
  end

end
