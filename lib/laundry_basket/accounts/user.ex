defmodule LaundryBasket.Accounts.User do

  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :first_name, :string
    field :second_name, :string
    field :email, :string
    field :phone, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    has_many :orders, LaundryBasket.Orders.Order, foreign_key: :customer_id
    has_one :rider, LaundryBasket.Accounts.Rider

    timestamps()
  end



  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_length(:password, min: 8)
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)

  end

  def registration_changeset(user, params \\ %{}) do
    user
    |> changeset(params)
    |> cast(params, [:first_name, :second_name, :phone, :password_confirmation])
    |> validate_required([:first_name, :second_name, :phone])
    |> cast(params, [:password_confirmation])
    |> validate_length(:password_confirmation, min: 8)
    |> validate_confirmation(:password)
    |> put_password_hash()
  end

  def put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))
      _ ->
          changeset
    end
  end



end
