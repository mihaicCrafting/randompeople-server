defmodule RandompplApiWeb.DefaultController do
    use RandompplApiWeb, :controller
  
    def index(conn, _params) do
      text conn, "heya\n\n\n\nxd"
    end
  end
