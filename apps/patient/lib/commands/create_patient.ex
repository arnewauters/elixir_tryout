defmodule Nf.PatientApp.Commands.CreatePatient do
  defstruct [:first_name, :last_name, :hospital_id]
  @type t :: %Nf.PatientApp.Commands.CreatePatient{}
end
