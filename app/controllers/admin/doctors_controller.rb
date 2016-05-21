class Admin::DoctorController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @doctor = doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
       redirect_to admin_doctor_index_path, notice: 'doctor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to admin_doctor_index_path, notice: 'doctor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to admin_doctor_index_path, notice: 'doctor was successfully destroyed.'
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :password, :photo, :diploma, :specialities, )
  end

end
