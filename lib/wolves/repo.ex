defmodule Wolves.Repo do
  use Ecto.Repo,
    otp_app: :wolves,
    adapter: Ecto.Adapters.Postgres
end
