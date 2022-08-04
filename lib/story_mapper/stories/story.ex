defmodule StoryMapper.Stories.Story do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stories" do
    # field :project_id, :integer ## project_id is a foreign key, by default we gave it a value of interger
    field :title, :string

    belongs_to :project, StoryMapper.Projects.Project
    timestamps()
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :project_id])
    |> validate_required([:title])
  end
end
