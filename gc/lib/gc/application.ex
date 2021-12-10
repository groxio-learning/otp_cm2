defmodule Gc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    IO.puts("Starting application")
    children = [
      {Gc.Server, :osman},
      {Gc.Server, :bruce},
      {Gc.Server, :raju}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    Supervisor.start_link(children, strategy: :rest_for_one, name: Gc.Supervisor)
  end
end
