class AddOrderToTimeslots < ActiveRecord::Migration[5.0]
  def self.up
    add_column :timeslots, :order, :integer
  end

  def self.down
    remove_column :timeslots, :order
  end
end
