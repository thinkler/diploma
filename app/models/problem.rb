class Problem < ActiveRecord::Base
  has_many :connects
  has_many :patients, through: :connects
end
