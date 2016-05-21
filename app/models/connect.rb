class Connect < ActiveRecord::Base
  belongs_to :problem
  belongs_to :patient
end
