class Ticket < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  belongs_to :speciality
  belongs_to :equipment

  def self.time_ticket(model, past)
    if past
      model.tickets.ransack(date_lt: Time.now).result
    else
      model.tickets.ransack(date_gteq: Time.now).result
    end
  end

end
