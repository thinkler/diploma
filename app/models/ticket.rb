class Ticket < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  belongs_to :speciality
  belongs_to :equipment
end
