class DeviseCreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|

      t.timestamps null: false
    end
  end
end
