class DoctorsController < ApplicationController

  def index
    @q = Doctor.ransack(params[:q])
    @doctors = @q.result.page(params[:page]).per(5)
  end

end
