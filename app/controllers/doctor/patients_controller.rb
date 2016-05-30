class Doctor::PatientsController < ApplicationController

  def index
    @q = Patient.ransack(params[:q])
    @patients = @q.result.order('id DESC').page(params[:page]).per(5)
  end

  def show
    @patient = Patient.find(params[:id])
    @notes = @patient.notes.order('id DESC').page(params[:page]).per(5)
  end

  def new_note
    @patient = Patient.find(params[:id])
    @note = Note.new
  end

  def create_note
    patient = Patient.find(params[:id])
    note = Note.new(note_params)
    note.patient_id = patient.id
    note.doctor_id = current_doctor.id
    note.save
    redirect_to doctor_patient_path(patient)
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :equipment_id, :speciality_id)
  end

end
