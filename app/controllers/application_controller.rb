class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_route_role

  def check_route_role
    if request.original_url.include? 'admin/'
      unless current_admin
        redirect_to root_path, alert: 'Access denied'
      end
    end
  end

  def current_patient
    Patient.find(session[:patient]["id"])
  end

  def add_status(text, patient, id, reason = "")
    if patient
      Status.create(body: text, patient_id: id, reason: reason)
    else
      Status.create(body: text, doctor_id: id, reason: reason)
    end
  end

end
