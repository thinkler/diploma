class DoctorsController < ApplicationController

  def index
    @q = Doctor.ransack(params[:q])
    @doctors = @q.result.order('id DESC').page(params[:page]).per(5)
  end

  def charts
  end

end
