defmodule RandompplApi.DirectoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RandompplApi.Directory` context.
  """

  @doc """
  Generate a human.
  """
  def human_fixture(attrs \\ %{}) do
    {:ok, human} =
      attrs
      |> Enum.into(%{
        avatar: "some avatar",
        name: "some name",
        quote: "some quote",
        role: "some role"
      })
      |> RandompplApi.Directory.create_human()

    human
  end
end
