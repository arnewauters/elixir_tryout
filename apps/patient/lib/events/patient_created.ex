defmodule Nf.PatientApp.Events.PatientCreated do
  defstruct [
    :id,
    :first_name,
    :last_name,
    :hospital_id,
    :date_created
  ]

  @type t :: %Nf.PatientApp.Events.PatientCreated{}
end
