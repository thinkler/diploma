class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :title
      t.text   :body
      t.timestamps null: false
    end
  end
end
