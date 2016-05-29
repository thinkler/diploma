class AddSpecIdToNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :speciality
    add_column :notes, :speciality_id, :integer
  end
end
