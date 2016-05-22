class AddEquipmentIdToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :equipment_id, :integer
  end
end
