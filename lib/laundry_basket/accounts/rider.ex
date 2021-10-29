defmodule LaundryBasket.Accounts.Rider do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
  This module describes the rider struct
  belongs_to macro likes the foreign key to a record
  """
  schema "riders" do
    field :status, :string
    field :vehicle, :string
    belongs_to :user, LaundryBasket.Accounts.User
    has_many :pickup_rider, LaundryBasket.Order, foreign_key: :pickup_id
    has_many :delivery_rider, LaundryBasket.Order, foreign_key: :delivery_id

    timestamps()
  end



end
