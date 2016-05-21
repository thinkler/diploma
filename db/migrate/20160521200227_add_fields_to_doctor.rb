class AddFieldsToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
    add_column :doctors, :about, :text
    add_attachment :doctors, :photo
    add_attachment :doctors, :diploma
  end
end
