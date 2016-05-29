class EquipmentController < ApplicationController

  def index
    @q = Equipment.ransack(params[:q])
    @equipment = @q.result.page(params[:page]).per(5)
  end

  def show
    @equipment = Equipment.find(params[:id])
  end

end
