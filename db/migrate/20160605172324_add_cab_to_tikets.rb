class AddCabToTikets < ActiveRecord::Migration
  def change
    add_column :tickets, :cabinet, :string
  end
end
