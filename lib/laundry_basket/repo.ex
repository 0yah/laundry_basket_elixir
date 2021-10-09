defmodule LaundryBasket.Repo do
  use Ecto.Repo,
    otp_app: :laundry_basket,
    adapter: Ecto.Adapters.Postgres
end
