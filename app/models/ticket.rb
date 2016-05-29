class Ticket < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  belongs_to :speciality
  belongs_to :equipment

  def self.time_ticket(current_patient, past)
    if past
      current_patient.tickets.ransack(date_lt: Time.now).result
    else
      current_patient.tickets.ransack(date_gteq: Time.now).result
    end
  end
end
