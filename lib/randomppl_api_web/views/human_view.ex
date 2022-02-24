defmodule RandompplApiWeb.HumanView do
  use RandompplApiWeb, :view
  alias RandompplApiWeb.HumanView

  def render("index.json", %{humans: humans}) do
    %{data: render_many(humans, HumanView, "human.json")}
  end

  def render("show.json", %{human: human}) do
    %{data: render_one(human, HumanView, "human.json")}
  end

  def render("human.json", %{human: human}) do
    %{
      id: human.id,
      name: human.name,
      quote: human.quote,
      avatar: human.avatar,
      role: human.role
    }
  end
end
