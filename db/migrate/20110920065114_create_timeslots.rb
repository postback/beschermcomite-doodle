class CreateTimeslots < ActiveRecord::Migration[5.0]
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
