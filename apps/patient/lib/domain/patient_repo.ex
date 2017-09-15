defmodule Nf.PatientApp.Domain.PatientRepo do

  alias Nf.PatientApp.Core.EventStore
  alias Nf.PatientApp.Domain.Patient

  def get(id) do
    case EventStore.get_events(id) do
      [] ->
        :not_found

      events ->
        IO.puts "get"
        IO.inspect events
        patient = Patient.new
               |> Patient.load_from_history(events)

        {:ok, patient}
    end
  end
end
