defmodule ShortStory.Router do
  use ShortStory.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ShortStory.Auth, repo: ShortStory.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShortStory do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/manage", ShortStory do
    pipe_through [:browser, :authenticate_user]

    resources "/posts", PostController
    resources "/comments", CommentController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShortStory do
  #   pipe_through :api
  # end
end
