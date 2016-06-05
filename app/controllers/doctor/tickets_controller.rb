class Doctor::TicketsController < ApplicationController

  def index
    @q = Ticket.time_ticket(current_doctor, params[:time]).ransack(params[:q])
    @tickets = @q.result.page(params[:page]).per(20)
  end

  def destroy
    ticket = Ticket.find(params[:id])
    add_status("Вы отменили прием на #{ticket.date.strftime('%d-%m-%y')}/#{ticket.time}", true, ticket.patient_id)
    add_status("Прием на #{ticket.date.strftime('%d-%m-%y')}/#{ticket.time} отменен доктором", false, current_doctor.id)
    ticket.delete
    redirect_to doctor_tickets_path
  end

end
