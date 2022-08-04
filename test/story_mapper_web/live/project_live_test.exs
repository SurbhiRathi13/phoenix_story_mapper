defmodule StoryMapperWeb.ProjectLiveTest do
  use StoryMapperWeb.ConnCase

  import Phoenix.LiveViewTest
  import StoryMapper.ProjectsFixtures
  import StoryMapper.StoriesFixtures

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  defp create_project(_) do
    project = project_fixture()
    %{project: project}
  end

  defp create_story(%{project: project}) do
    story = story_fixture(%{project_id: project.id, title: "My First User Story"}) #giving a title to the story
    %{story: story}
  end

  describe "Index" do
    setup [:create_project]

    test "lists all projects", %{conn: conn, project: project} do
      {:ok, _index_live, html} = live(conn, Routes.project_index_path(conn, :index))

      assert html =~ "Listing Projects"
      assert html =~ project.title
    end

  end

  describe "Show" do
    setup [:create_project, :create_story]

    test "displays project", %{conn: conn, project: project} do
      {:ok, _show_live, html} = live(conn, Routes.project_show_path(conn, :show, project))

      StoryMapper.Projects.get_project!(project.id) |> StoryMapper.Repo.preload(:stories)

      IO.inspect(project)
      IO.inspect(project.stories)

      assert html =~ "Show Project"
      assert html =~ project.title
      assert html =~ "My First User Story"
    end

  end
end
