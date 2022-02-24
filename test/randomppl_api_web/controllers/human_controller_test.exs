defmodule RandompplApiWeb.HumanControllerTest do
  use RandompplApiWeb.ConnCase

  import RandompplApi.DirectoryFixtures

  alias RandompplApi.Directory.Human

  @create_attrs %{
    avatar: "some avatar",
    name: "some name",
    quote: "some quote",
    role: "some role"
  }
  @update_attrs %{
    avatar: "some updated avatar",
    name: "some updated name",
    quote: "some updated quote",
    role: "some updated role"
  }
  @invalid_attrs %{avatar: nil, name: nil, quote: nil, role: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all humans", %{conn: conn} do
      conn = get(conn, Routes.human_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create human" do
    test "renders human when data is valid", %{conn: conn} do
      conn = post(conn, Routes.human_path(conn, :create), human: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.human_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "avatar" => "some avatar",
               "name" => "some name",
               "quote" => "some quote",
               "role" => "some role"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.human_path(conn, :create), human: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update human" do
    setup [:create_human]

    test "renders human when data is valid", %{conn: conn, human: %Human{id: id} = human} do
      conn = put(conn, Routes.human_path(conn, :update, human), human: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.human_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "avatar" => "some updated avatar",
               "name" => "some updated name",
               "quote" => "some updated quote",
               "role" => "some updated role"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, human: human} do
      conn = put(conn, Routes.human_path(conn, :update, human), human: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete human" do
    setup [:create_human]

    test "deletes chosen human", %{conn: conn, human: human} do
      conn = delete(conn, Routes.human_path(conn, :delete, human))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.human_path(conn, :show, human))
      end
    end
  end

  defp create_human(_) do
    human = human_fixture()
    %{human: human}
  end
end
