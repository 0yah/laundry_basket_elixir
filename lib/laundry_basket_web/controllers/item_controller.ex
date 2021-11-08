defmodule LaundryBasketWeb.ItemController do
  use LaundryBasketWeb, :controller

  alias LaundryBasket.Items
  alias LaundryBasket.Items.Item
  alias LaundryBasket.Repo

  def index(conn, _params) do
    render(conn, "all.html", item: Items.list_items())
  end

  def new(conn, _params) do
    changeset = Items.item_changeset()
    render(conn, "new.html", changeset: changeset)
  end

  @doc """
  case Items.create_item(item_params) do
    {:ok, item} ->
      conn
      |> put_flash(:info, "Item created successfully.")
      |> redirect(to: Routes.item_path(conn, :show, item))
    {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
  end

  Repo.transaction fn ->
      with {:ok, item} <-
        %Item{} |> Item.changeset(%{name: name, price: price, image_link: filename}) |> Repo.insert(), :ok <- File.cp(path, filename)
      do
        IO.puts("Sucess")
      else
        {:error, reason} = error -> error
      end
    end
  """
  def create(conn, %{"item" => item_params}) do
    %{"image" => %Plug.Upload{} = upload, "name" => name, "price" => price} = item_params
    extension = Path.extname(upload.filename)

    Repo.transaction fn ->
      with {:ok, item} <-
        %Item{} |> Item.changeset(%{name: name, price: price, image_link: upload.filename }) |> Repo.insert(), :ok <- File.cp(upload.path, "./uploads/#{name}#{extension}")
      do
        IO.inspect item
      else
        {:error, reason} = error ->
          IO.inspect reason
          IO.inspect error

      end
    end

    changeset = Items.item_changeset()
    render(conn, "new.html", changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    item = Items.get_item!(id)
    render(conn, "show.html", item: item)
  end

  def edit(conn, %{"id" => id}) do
    item = Items.get_item!(id)
    changeset = Items.update_item_changeset(item)
    render(conn, "edit.html", item: item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Items.get_item!(id)
    case Items.update_item(item, item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: Routes.item_path(conn, :show, item))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Items.get_item!(id)
    {:ok, _item} = Items.delete_item(item)
    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.item_path(conn, :index))
  end

end
