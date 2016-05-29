class Day < ActiveRecord::Base
  belongs_to :doctor

  def self.clear_empty
    Day.all.each do |d|
      d.delete unless d.doctor_id
    end
  end

  def self.free_day(date, time)
    day = Day.find_by(date: date)
    day.times[time] = false
    day.save
  end

end
