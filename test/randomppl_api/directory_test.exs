defmodule RandompplApi.DirectoryTest do
  use RandompplApi.DataCase

  alias RandompplApi.Directory

  describe "humans" do
    alias RandompplApi.Directory.Human

    import RandompplApi.DirectoryFixtures

    @invalid_attrs %{avatar: nil, name: nil, quote: nil, role: nil}

    test "list_humans/0 returns all humans" do
      human = human_fixture()
      assert Directory.list_humans() == [human]
    end

    test "get_human!/1 returns the human with given id" do
      human = human_fixture()
      assert Directory.get_human!(human.id) == human
    end

    test "create_human/1 with valid data creates a human" do
      valid_attrs = %{avatar: "some avatar", name: "some name", quote: "some quote", role: "some role"}

      assert {:ok, %Human{} = human} = Directory.create_human(valid_attrs)
      assert human.avatar == "some avatar"
      assert human.name == "some name"
      assert human.quote == "some quote"
      assert human.role == "some role"
    end

    test "create_human/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_human(@invalid_attrs)
    end

    test "update_human/2 with valid data updates the human" do
      human = human_fixture()
      update_attrs = %{avatar: "some updated avatar", name: "some updated name", quote: "some updated quote", role: "some updated role"}

      assert {:ok, %Human{} = human} = Directory.update_human(human, update_attrs)
      assert human.avatar == "some updated avatar"
      assert human.name == "some updated name"
      assert human.quote == "some updated quote"
      assert human.role == "some updated role"
    end

    test "update_human/2 with invalid data returns error changeset" do
      human = human_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_human(human, @invalid_attrs)
      assert human == Directory.get_human!(human.id)
    end

    test "delete_human/1 deletes the human" do
      human = human_fixture()
      assert {:ok, %Human{}} = Directory.delete_human(human)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_human!(human.id) end
    end

    test "change_human/1 returns a human changeset" do
      human = human_fixture()
      assert %Ecto.Changeset{} = Directory.change_human(human)
    end
  end
end
