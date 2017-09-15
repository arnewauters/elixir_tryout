defmodule Nf.PatientApp.Api do
  ## Event Bus
  alias Nf.PatientApp.Core.Bus

  ## Commands
  alias Nf.PatientApp.Commands.CreatePatient

  def create_patient(first_name, last_name, hospital_id) do
    Bus.send_command(%{
        %CreatePatient{} | :first_name => first_name, :last_name => last_name, :hospital_id => hospital_id
      })

  end
end
