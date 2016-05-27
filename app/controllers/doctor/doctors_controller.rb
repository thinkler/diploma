class Doctor::DoctorsController < ApplicationController
  def personal_info
    @doctor = current_doctor
  end
end
