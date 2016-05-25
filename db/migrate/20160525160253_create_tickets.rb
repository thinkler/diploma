class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|

      t.integer :patient_id
      t.integer :equipment_id
      t.integer :doctor_id
      t.integer :speciality_id

      t.string  :time

      t.timestamps null: false
    end
  end
end
