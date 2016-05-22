class RenamePatientField < ActiveRecord::Migration
  def change
    rename_column :patients, :personal_numner, :personal_number
  end
end
