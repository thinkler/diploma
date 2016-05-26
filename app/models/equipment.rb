class Equipment < ActiveRecord::Base
  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/

  has_and_belongs_to_many :doctors

  has_many :notes
  has_many :tickets
end
