defmodule Nf.PatientApp do
  use Application

  alias Nf.PatientApp.Core.EventStore
  alias Nf.PatientApp.Core.EventHandler
  alias Nf.PatientApp.Core.CommandHandler

  def start(_type, _args) do
    EventStore.init()

    case Nf.PatientApp.Supervisor.start_link() do
      {:ok, pid} ->
        EventHandler.subscribe_on_bus()
        CommandHandler.subscribe_on_bus()
        {:ok, pid}

      error -> {:error, error}
    end
  end
end
