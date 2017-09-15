defmodule Nf.PatientApp.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      supervisor(Nf.PatientApp.Core.EventStore, []),
      worker(Nf.PatientApp.Core.Bus, [], restart: :temporary)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
