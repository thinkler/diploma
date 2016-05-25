class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|

      t.string :title
      t.text :body
      t.string :speciality
      t.integer :doctor_id
      t.integer :equipment_id
      t.integer :patient_id
      t.attachment :doc

      t.timestamps null: false
    end
  end
end
