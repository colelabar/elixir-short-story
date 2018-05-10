defmodule ShortStory.Comment do
  use ShortStory.Web, :model

  schema "comments" do
    field :content, :string
    belongs_to :user, ShortStory.User
    belongs_to :post, ShortStory.Post

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
