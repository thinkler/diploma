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
