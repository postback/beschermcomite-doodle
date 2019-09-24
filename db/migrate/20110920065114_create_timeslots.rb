class CreateTimeslots < ActiveRecord::Migration
  def self.up
    create_table :timeslots do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :timeslots
  end
end
