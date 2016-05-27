class Day < ActiveRecord::Base
  belongs_to :doctor

  def self.clear_empty
    Day.all.each do |d|
      d.delete unless d.doctor_id
    end
  end
end
