class Patient < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  validates :password, presence: false

  has_many :connects
  has_many :problems, through: :connects
  has_many :notes
  has_many :tickets
  has_many :specialities, through: :tickets
end
