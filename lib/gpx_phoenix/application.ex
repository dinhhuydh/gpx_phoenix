defmodule GpxPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GpxPhoenix.Repo,
      # Start the Telemetry supervisor
      GpxPhoenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GpxPhoenix.PubSub},
      # Start the Endpoint (http/https)
      GpxPhoenixWeb.Endpoint
      # Start a worker by calling: GpxPhoenix.Worker.start_link(arg)
      # {GpxPhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GpxPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GpxPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
