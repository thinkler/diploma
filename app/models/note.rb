# Note
class Note < ActiveRecord::Base
  has_attached_file :doc, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  belongs_to :patient
  belongs_to :doctor
  belongs_to :equipment
end
