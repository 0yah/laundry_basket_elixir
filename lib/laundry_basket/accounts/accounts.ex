defmodule  LaundryBasket.Accounts do
  alias LaundryBasket.Repo
  alias LaundryBasket.Accounts.User

  def get_user(id) do
    Repo.get(User, id)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  @doc """
  Gets the user by email address
  if the user is found and the password given matches the hashed password return the user
  if the user is found but the hashed password does not match return errors
  """
  def authenticate_by_email_and_pass(email, given_pass) do
    user = get_user_by(email: email)

    cond do
      user && Pbkdf2.verify_pass(given_pass, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, :unauthorized}

      true ->
        Pbkdf2.no_user_verify()
        {:error, :not_found}
    end
  end

  def list_users do
    Repo.all(User)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def change_registration(%User{} = user, params) do
    User.registration_changeset(user, params)
  end

  def register_user(attrs \\ %{}) do
    changeset = User.registration_changeset(%User{}, attrs)
    IO.inspect(changeset)
    IO.inspect(attrs)

    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

end
