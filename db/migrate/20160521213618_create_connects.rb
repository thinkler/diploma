class CreateConnects < ActiveRecord::Migration
  def change
    create_table :connects do |t|
      t.belongs_to :problem
      t.belongs_to :patient

      t.timestamps null: false
    end
  end
end
