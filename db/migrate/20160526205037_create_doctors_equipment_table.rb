class CreateDoctorsEquipmentTable < ActiveRecord::Migration
  def change
    create_table :doctors_equipment do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :equipment, index: true
    end
  end
end
