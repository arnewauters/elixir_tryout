defmodule Nf.PatientApp.Core.EventStore do
  @table_id __MODULE__

  ## Event Bus
  alias Nf.PatientApp.Core.Bus

  def init() do
    :ets.new(@table_id, [:public, :named_table])
  end

  def append_events(key, events) do
    stored_events   = get_raw_events(key)
    new_event       = List.first(:lists.reverse(events))
    combined_events = List.insert_at(stored_events, -1,  new_event)

    :ets.insert(@table_id, {key, combined_events})

    IO.puts "Event Store Published Event"
    Bus.publish_event(new_event)
  end

  def get_events(key) do
    :lists.reverse(get_raw_events(key))
  end

  def delete(key) do
    :ets.delete(@table_id, key)
  end

  def get_raw_events(key) do
    case :ets.lookup(@table_id, key) do
      [{_key, events}] -> events
      [] -> []
     end
  end
end
