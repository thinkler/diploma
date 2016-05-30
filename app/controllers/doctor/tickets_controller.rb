class Doctor::TicketsController < ApplicationController

  def index
    @tickets = Ticket.time_ticket(current_doctor, params[:time]).page(params[:page]).per(20)
  end

end
