defmodule Nf.PatientApp.Domain.Patient do
  alias Nf.PatientApp.Events.PatientCreated

  defmodule State do
    defstruct [
      :id,
      :date_created,
      :first_name,
      :last_name,
      :hospital_id,
      :changes
    ]
    @type t :: %State{}
  end

  def new do
    %State{}
  end

  def apply_event(event = %PatientCreated{}, state) do
    %{ state | :id => event.id,
      :first_name => event.first_name,
      :last_name => event.last_name,
      :hospital_id => event.hospital_id }
  end

  def apply_many_events([], state) do
    state
  end

  def apply_many_events([event|rest], state) do
    new_state = apply_event(event, state)
    apply_many_events(rest, new_state)
  end

  def load_from_history(state, events) do
    apply_many_events(events, state)
  end
end
