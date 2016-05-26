class Patient::TicketsController < ApplicationController

  def new
    set_defaults_collections
  end

  def search
    @klass = params[:klass]
    if params[:q] == 'all'
      set_defaults_collections
    else
      @doctors = Doctor.ransack(first_name_cont: params[:q]).result.limit(5) if params[:klass] == 'doctors'
      @equipment = Equipment.ransack(title_cont: params[:q]).result.limit(5) if params[:klass] == 'equipment'
      @specialities = Speciality.ransack(title_cont: params[:q]).result.limit(5) if params[:klass] == 'specialities'
    end
    respond_to do |format|
      format.js   { render partial: 'patient/tickets/search_results.js.erb' }
    end
  end

  def set_defaults_collections
    @doctors = Doctor.all.limit(5)
    @equipment = Equipment.all.limit(5)
    @specialities = Speciality.all.limit(5)
  end

  def select_resource
    @klass = params[:klass].downcase
    resource = params[:klass].constantize
    @item = resource.find(params[:id])
    respond_to do |format|
      format.js   { render partial: 'patient/tickets/selected_resource.js.erb' }
    end
  end

  def filtered_doctors
  end

  def filtered_equipment
  end

  def filtered_specialities
  end

end
