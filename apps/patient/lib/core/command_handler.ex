defmodule Nf.PatientApp.Core.CommandHandler do
  use GenEvent
  require Logger

  ## Commands
  alias Nf.PatientApp.Commands.CreatePatient

  ## Events
  alias Nf.PatientApp.Events.PatientCreated

  ## Event Bus
  alias Nf.PatientApp.Core.Bus

  ## Event Store
  alias Nf.PatientApp.Core.EventStore

  def subscribe_on_bus do
    Bus.add_handler(__MODULE__, [])
  end

  def unsubscribe_from_bus do
    Bus.remove_handler(__MODULE__, [])
  end

  def init([]) do
    {:ok, []}
  end

  def handle_event(command = %CreatePatient{}, state) do
    IO.puts "Command Handler: Create Patient"
    # TODO: for duplicate hospital id
    # Try adding hospital id to dedicated table with unique index
    new_id = UUID.uuid1()

    event = %{%PatientCreated{} |
     :id => new_id,
     :first_name => command.first_name,
     :last_name => command.last_name,
     :hospital_id => command.hospital_id,
     :date_created => :calendar.local_time,
   }

    # 2. Push event to EventStore
    EventStore.append_events(new_id, [event])

    {:ok, state}
  end

  def handle_event(_, state) do
    {:ok, state}
  end

  def handle_call(_, state) do
    {:ok, state}
  end

  def handle_info(_, state) do
    {:ok, state}
  end

  def terminate(_reason, _state) do
    :ok
  end

  def code_change(_old_vsn, state, _extra) do
    {:ok, state}
  end
end
