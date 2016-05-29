class Patient::NotesController < ApplicationController

  def index
    @notes = current_patient.notes.page(params[:page]).per(5)
  end

  def show
    @note = current_patient.notes.find(params[:id])
  end

end
