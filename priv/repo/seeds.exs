# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LaundryBasket.Repo.insert!(%LaundryBasket.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias LaundryBasket.{Repo, Accounts.User, Accounts.Rider, Orders.Order}

user_one = %User{first_name: "sd", second_name: "ds", email: "as@dk.com", phone: "2332233232"}
user_one = Repo.insert! user_one
#user_one = Repo.get_by!(User, id: 1)

rider_one = %Rider{user: user_one, status: "KJJKKJJK", vehicle: "sdkjsdjkkj"}
rider_one = Repo.insert! rider_one
#rider_one = Repo.get_by!(Rider, id: 1)


order_one = %Order{
  delivery_rider: rider_one,
  pickup_rider: rider_one,
  price: 190.23,
  status: "Available",
  customer: user_one
}



order_one = Repo.insert!(order_one)

