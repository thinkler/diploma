class AddFieldsToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :first_name, :string
    add_column :patients, :last_name, :string
    add_column :patients, :personal_numner, :string
    add_column :patients, :work_position, :string

    add_attachment :patients, :photo
  end
end
