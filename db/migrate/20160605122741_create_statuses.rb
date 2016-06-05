class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :body
      t.string :reason
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps null: false
    end
  end
end
