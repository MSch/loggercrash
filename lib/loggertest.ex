defmodule Loggertest do
  use Application
  require Logger

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      FailingPlug.child_spec,
    ]

    IO.inspect Application.start(:logger)
    IO.inspect Process.whereis(Logger)
    Logger.debug "A"


    opts = [strategy: :one_for_one, name: Loggertest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule FailingPlug do
  use Plug.Router
  import Plug.Conn

  plug :match
  plug :dispatch

  def child_spec do
    # This should crash because port 1 can't be bound
    Plug.Adapters.Cowboy.child_spec(:http, __MODULE__, [], [port: 1])
  end

  match _ do
    send_resp(conn, 404, "")
  end
end
