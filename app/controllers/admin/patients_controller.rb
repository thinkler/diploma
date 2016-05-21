class Admin::PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = Patient.all.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      add_problems(params[:problems], @patient)
      redirect_to admin_patients_path, notice: 'patient was successfully created.'
    else
      render :new
    end
  end

  def update
    if @patient.update(patient_params)
      add_problems(params[:problems], @patient)
      redirect_to admin_patients_path, notice: 'patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to admin_patients_path, notice: 'patient was successfully destroyed.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:email, :first_name, :last_name, :personal_numner, :photo, :position)
  end

  def add_problems(specs, patient)
    patient.problems.delete_all
    specs.split(" ").each do |pr|
      problem = Problem.find_or_initialize_by(title: pr)
      problem.patients << patient
      problem.save
    end
  end

end
