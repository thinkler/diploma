class Patient::TicketsController < ApplicationController

  def new
    @doctors = Doctor.all
    @equipments = Equipment.all
    @specialities = Speciality.all
  end

  def doc_search
    render json: Doctor.ransack(first_name_cont: params[:term]).result.pluck(:first_name).to_json
  end

end
