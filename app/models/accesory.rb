class Accesory < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :speciality
end
