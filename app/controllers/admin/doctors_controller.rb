class Admin::DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all.order('id DESC').page(params[:page]).per(10)
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      add_relations(params[:specialities], params[:equipment],@doctor)
      redirect_to admin_doctors_path, notice: 'doctor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @doctor.update(doctor_params)
      add_relations(params[:specialities], params[:equipment], @doctor)
      redirect_to admin_doctors_path, notice: 'doctor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to admin_doctors_path, notice: 'doctor was successfully destroyed.'
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:email, :first_name, :last_name, :password, :photo, :diploma, :about)
  end

  def add_relations(specs, equip, doctor)
    doctor.specialities.delete_all
    doctor.equipments.delete_all
    specs.split(" ").each do |sp|
      speciality = Speciality.find_or_initialize_by(title: sp)
      speciality.doctors << doctor
      speciality.save
    end
    equip.split(" ").each do |eq|
      equipment = Equipment.find_by(title: eq)
      if equipment
        doctor.equipments << equipment
      end
    end
  end

end
