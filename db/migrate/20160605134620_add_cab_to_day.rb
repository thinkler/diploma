class AddCabToDay < ActiveRecord::Migration
  def change
    add_column :days, :cabinet, :string
  end
end
