class Admin::EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  def index
    @equipment = Equipment.all.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @equipment = Equipment.new
  end

  def edit
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
       redirect_to admin_equipment_index_path, notice: 'Equipment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @equipment.update(equipment_params)
      redirect_to admin_equipment_index_path, notice: 'Equipment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @equipment.destroy
    redirect_to admin_equipment_index_path, notice: 'Equipment was successfully destroyed.'
  end

  private

    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    def equipment_params
      params.require(:equipment).permit(:title, :body, :pic)
    end
end
