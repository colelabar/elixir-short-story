defmodule ShortStory.PageController do
  use ShortStory.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
