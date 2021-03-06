class Admin::EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  def index
    @equipment = Equipment.all.order('id DESC').page(params[:page]).per(10)
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
      add_relations(params[:doctors], @equipment)
      redirect_to admin_equipment_index_path, notice: 'Equipment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @equipment.update(equipment_params)
      add_relations(params[:doctors], @equipment)
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

    def add_relations(docs, equipment)
      equipment.doctors.delete_all
      docs.split(" ").each do |doc|
        doctor = Doctor.find_by(last_name: doc)
        if doctor
          equipment.doctors << doctor
        end
      end
    end
end
