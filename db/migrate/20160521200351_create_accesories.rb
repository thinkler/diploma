class CreateAccesories < ActiveRecord::Migration
  def change
    create_table :accesories do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :speciality, index: true

      t.timestamps null: false
    end
  end
end
