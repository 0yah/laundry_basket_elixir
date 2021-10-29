defmodule LaundryBasket.Repo.Migrations.CreateRider do
  use Ecto.Migration

  @moduledoc """
  This migration creates a one to one relationship between the users and riders
  The user_id column references an entry into the users table
  """
  def change do
    create table(:riders) do
      add :status, :string
      add :vehicle, :string
      add :user_id, references(:users)
    end
  end
end
