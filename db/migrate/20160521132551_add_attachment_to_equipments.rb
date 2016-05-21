class AddAttachmentToEquipments < ActiveRecord::Migration
  def up
    add_attachment :equipment, :pic
  end

  def down
    remove_attachment :equipment, :pic
  end
end
