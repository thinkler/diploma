class AddDateToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :date, :datetime
  end
end
