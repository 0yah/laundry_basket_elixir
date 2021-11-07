defmodule LaundryBasketWeb.UserController do
  use LaundryBasketWeb, :controller
  alias LaundryBasket.Repo




  def login(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "login.html", changeset: changeset
  end

  def sign_in(conn, %{"user" => %{"email" => email, "password" => given_password}}) do

    case LaundryBasket.Accounts.authenticate_by_email_and_pass(email, given_password) do
      {:ok, user} ->
        conn
        |> LaundryBasketWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid email/password combination")
        |> render("login.html")
    end
  end


  def new(conn, _params) do
    changeset = LaundryBasket.Accounts.change_registration(%User{}, %{})
    render conn, "register.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do

    case LaundryBasket.Accounts.register_user(user_params) do
      {:ok, user} ->
        conn
        |> LaundryBasketWeb.Auth.login(user)
        |> put_flash(:info, "#{user.first_name} #{user.second_name}")
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render conn, "register.html", changeset: changeset
    end
  end

  def delete(conn, _)do
    conn
    |> LaundryBasketWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end

end
