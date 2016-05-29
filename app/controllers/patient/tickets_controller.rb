class Patient::TicketsController < ApplicationController
  def new
    @url = request.original_url
    set_current_items
    set_defaults_collections
  end

  def search
    @url = ''
    @klass = params[:klass]
    if params[:q] == 'all'
      set_defaults_collections
    else
      @doctors = doctors.ransack(first_name_cont: params[:q]).result.limit(5) if params[:klass] == 'doctors'
      @equipment = equipment.ransack(title_cont: params[:q]).result.limit(5) if params[:klass] == 'equipment'
      @specialities = specialities.ransack(title_cont: params[:q]).result.limit(5) if params[:klass] == 'specialities'
    end
    respond_to do |format|
      format.js   { render partial: 'patient/tickets/search_results.js.erb' }
    end
  end

  def find_day
    @doc = Doctor.find(params[:doc_id]) if params[:doc_id]
    @spec = Speciality.find(params[:spec_id]) if params[:spec_id]
    @equip = Equipment.find(params[:equip_id]) if params[:equip_id]
    @day = @doc.days.find_by(date: params[:date]) unless params[:date] == 'null'
    respond_to do |format|
      format.js { render partial: 'day_result' } if @day
      format.js { render nothing: true }
    end
  end

  def create
    day = Day.find(params[:day])
    day.times[params[:time]] = true
    day.save
    Ticket.create(patient_id: current_patient.id, equipment_id: params[:equip],
                  doctor_id: params[:doc], speciality_id: params[:spec],
                  time: params[:time], date: day.date)
    redirect_to patient_tickets_path
  end

  def index
    @tickets = Ticket.time_ticket(current_patient, params[:time]).page(params[:page]).per(20)
  end

  def destroy
    ticket = Ticket.find(params[:id])
    Day.free_day(ticket.date, ticket.time)
    ticket.destroy
    redirect_to patient_tickets_path
  end

  private

  def doctors
    Doctor.ransack(specialities_id_eq: params[:spec_id], equipments_id_eq: params[:equip_id]).result
  end

  def equipment
    Equipment.ransack(doctors_id_eq: params[:doc_id], doctors_specialities_id_eq: params[:spec_id]).result
  end

  def specialities
    Speciality.ransack(doctors_id_eq: params[:doc_id], doctors_equipments_id_eq: params[:equip_id]).result
  end

  def set_defaults_collections
    @doctors = Doctor.ransack(specialities_id_eq: params[:spec_id], equipments_id_eq: params[:equip_id]).result.limit(5)
    @equipment = Equipment.ransack(doctors_id_eq: params[:doc_id], doctors_specialities_id_eq: params[:spec_id]).result.limit(5)
    @specialities = Speciality.ransack(doctors_id_eq: params[:doc_id], doctors_equipments_id_eq: params[:equip_id]).result.limit(5)
  end

  def set_current_items
    @doctor = Doctor.find(params[:doc_id]) if params[:doc_id]
    @equip = Equipment.find(params[:equip_id]) if params[:equip_id]
    @spec = Speciality.find(params[:spec_id]) if params[:spec_id]
  end
end
