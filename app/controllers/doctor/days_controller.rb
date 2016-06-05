class Doctor::DaysController < ApplicationController

  def new
    @day = Day.create(times: default_times)
  end

  def update
    @day = Day.find(params[:id])
    @day.date = params[:date]
    @day.cabinet = params[:cabinet]
    @day.doctor_id = current_doctor.id
    @day.notes = params[:notes]
    @day.save
    redirect_to doctor_days_path
  end

  def index
    Day.clear_empty
    @days = params[:past] ? past_days : future_days
  end

  def show
    @day = Day.find(params[:id])
  end

  def destroy
    day = Day.find(params[:id])
    delete_tickets(day.date)
    day.delete
    add_status("Вы отменили день #{day.date.strftime('%d-%m-%y')}", false, current_doctor.id)
    redirect_to doctor_days_path
  end

  def destroy_day
    day = Day.find(params[:id])
    day.times.delete(params[:time])
  end

  def change_time
    @day = Day.find(params[:id])
    @day.times["#{params[:time]}"] = false if params[:type] == 'add'
    if params[:type] == 'delete'
      @day.delete_time(params[:time])
      ticket = Ticket.find_by(date: @day.date, time: params[:time])
      add_status("Время #{@day.date.strftime('%d-%m-%y')}/##{params[:time]} было отменено доктором", true, ticket.patient_id) if ticket
      byebug
      add_status("Вы отменили время #{@day.date.strftime('%d-%m-%y')}/#{params[:time]}", false, current_doctor.id)
      ticket.delete if ticket
    end
    @day.save
    @times = @day.times
    respond_to do |format|
      format.js { render partial: 'new_time' }
    end
  end

  private

  def permit_params
    params.require(:day).permit(:date, :notes, :cabinet)
  end

  def default_times
    res = {}
    9.times do |i|
      res.merge!({"#{i+9}:00" => false})
      res.merge!({"#{i+9}:30" => false})
    end
    res
  end

  def past_days
    current_doctor.days.ransack(date_lt: Time.now).result.order(:date).page(params[:page]).per(10)
  end

  def future_days
    current_doctor.days.ransack(date_gteq: Time.now).result.order(:date).page(params[:page]).per(10)
  end


  def delete_tickets(date)
    tickets = Ticket.where(date: date)
    tickets.each do |t|
      t.delete
      add_status("Приемный день #{date.strftime('%d-%m-%y')} был отменен доктором", true, t.patient_id)
    end
  end

end
