class Doctor::TicketsController < ApplicationController

  def index
    @q = Ticket.time_ticket(current_doctor, params[:time]).ransack(params[:q])
    @tickets = @q.result.page(params[:page]).per(20)
  end

  def destroy
    Ticket.find(params[:id]).destroy
    redirect_to doctor_tickets_path
  end

end
