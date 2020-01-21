defmodule Pigpiox.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      {Pigpiox.Port, [name: Pigpiox.Port]},
      {Pigpiox.Socket, [name: Pigpiox.Socket]},
      {Pigpiox.GPIO.WatcherSupervisor, []}
    ]

    Supervisor.init(children, strategy: :rest_for_one)
  end
end

