class Speciality < ActiveRecord::Base
  has_many :accesories
  has_many :doctors, through: :accesories
  has_many :tickets
end
