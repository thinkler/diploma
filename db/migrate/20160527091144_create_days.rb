class CreateDays < ActiveRecord::Migration
  def change
    enable_extension 'hstore'

    create_table :days do |t|
      t.hstore :times
      t.text   :notes
      t.integer :doctor_id
      t.datetime :date

      t.timestamps null: false
    end
  end
end
