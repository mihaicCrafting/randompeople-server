defmodule RandompplApiWeb.HumanController do
  use RandompplApiWeb, :controller

  alias RandompplApi.Directory
  alias RandompplApi.Directory.Human

  action_fallback RandompplApiWeb.FallbackController

  def index(conn, _params) do
    humans = Directory.list_humans()
    render(conn, "index.json", humans: humans)
  end

  def create(conn, %{"human" => human_params}) do
    with {:ok, %Human{} = human} <- Directory.create_human(human_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.human_path(conn, :show, human))
      |> render("show.json", human: human)
    end
  end

  def show(conn, %{"id" => id}) do
    human = Directory.get_human!(id)
    render(conn, "show.json", human: human)
  end

  def update(conn, %{"id" => id, "human" => human_params}) do
    human = Directory.get_human!(id)

    with {:ok, %Human{} = human} <- Directory.update_human(human, human_params) do
      render(conn, "show.json", human: human)
    end
  end

  def delete(conn, %{"id" => id}) do
    human = Directory.get_human!(id)

    with {:ok, %Human{}} <- Directory.delete_human(human) do
      send_resp(conn, :no_content, "")
    end
  end

  # def getHumanById(conn,%{"id" => id}) do
  #   send_resp(conn,"hello")
  # end
end
