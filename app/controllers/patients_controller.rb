class PatientsController < ApplicationController

  def sign_in
    patient = Patient.find_by(permit_params)
    session[:patient] = patient
    redirect_to root_path, notice: "#{patient.first_name}, вы успешно вошли"
  end

  def sign_out
    session[:patient] = nil
    redirect_to root_path, notice: "Вы успешно вышли"
  end

  private

  def permit_params
    params.require(:patient).permit(:first_name, :last_name, :personal_number)
  end

end
