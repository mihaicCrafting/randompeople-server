defmodule RandompplApi.Repo do
  use Ecto.Repo,
    otp_app: :randomppl_api,
    adapter: Ecto.Adapters.Postgres
end
