defmodule ShortStory.UserController do
  use ShortStory.Web, :controller

  plug :authenticate_user when action in [:index, :show]

  def index(conn, _params) do
    users = Repo.all(ShortStory.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(ShortStory.User, id)
    render conn, "show.html", user: user
  end

  alias ShortStory.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> ShortStory.Auth.login(user)
        |> put_flash(:info, "New user \"#{user.username}\" created!")
        |> redirect(to: post_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
