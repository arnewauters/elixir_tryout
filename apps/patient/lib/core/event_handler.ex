defmodule Nf.PatientApp.Core.EventHandler do
  use GenEvent

  ## Events
  alias Nf.PatientApp.Events.PatientCreated

  ## Event Bus
  alias Nf.PatientApp.Core.Bus

  def subscribe_on_bus do
    Bus.add_handler(__MODULE__, [])
  end

  def unsubscribe_from_bus do
    Bus.remove_handler(__MODULE__, [])
  end

  def init([]) do
    {:ok, []}
  end

  def handle_event(event = %PatientCreated{}, state) do
    IO.puts "Event Handler: Patient Created"
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
