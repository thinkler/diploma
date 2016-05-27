class Doctor::DaysController < ApplicationController

  def new
    @day = Day.create(times: default_times)
  end

  def update
    @day = Day.find(params[:id])
    @day.date = params[:date]
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
    Day.find(params[:id]).delete
    redirect_to doctor_days_path
  end

  def change_time
    @day = Day.find(params[:id])
    @day.times["#{params[:time]}"] = false if params[:type] == 'add'
    @day.times.delete(params[:time]) if params[:type] == 'delete'
    @day.save
    respond_to do |format|
      format.js { render partial: 'new_time' }
    end
  end

  private

  def permit_params
    params.require(:day).permit(:date, :notes)
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
    current_doctor.days.ransack(date_lt: Time.now).result
  end

  def future_days
    current_doctor.days.ransack(date_gteq: Time.now).result
  end

end
