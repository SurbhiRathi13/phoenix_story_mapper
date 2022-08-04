defmodule StoryMapper.StoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StoryMapper.Stories` context.
  """

  @doc """
  Generate a story.
  """
  def story_fixture(attrs \\ %{}) do
    {:ok, story} =
      attrs
      |> Enum.into(%{
        #project_id: 1, # we are always resetting the table anyways. we will assume it's 1 whenever we create a project
        title: "some title"
      })
      |> StoryMapper.Stories.create_story()

    story
  end
end
