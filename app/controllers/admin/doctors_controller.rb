class Admin::DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all.page(params[:page]).per(10)
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
      add_specialities(params[:specialities], @doctor)
      redirect_to admin_doctors_path, notice: 'doctor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @doctor.update(doctor_params)
      add_specialities(params[:specialities], @doctor)
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

  def add_specialities(specs, doctor)
    doctor.specialities.delete_all
    specs.split(" ").each do |sp|
      speciality = Speciality.find_or_initialize_by(title: sp)
      speciality.doctors << doctor
      speciality.save
    end
  end

end
