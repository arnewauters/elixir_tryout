defmodule Nf.PatientApp.Core.EventStore do
  use Ecto.Repo, otp_app: :patient_app

  ## Event Bus
  alias Nf.PatientApp.Core.Bus

  def append_event(event) do
    IO.puts "Event Store Published Event"
    insert(event)
    Bus.publish_event(event)
  end
end

defmodule Nf.PatientApp.Core.Event do
  use Ecto.Schema

  schema "event" do
    field :aggregate_id, :string
    field :payload,      :map
    field :created_at,   :datetime
  end
end
