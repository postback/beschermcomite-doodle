class AddTimeslotIdToApplications < ActiveRecord::Migration
  def self.up
    add_column :applications, :timeslot_id, :integer
  end

  def self.down
    remove_column :applications, :timeslot_id
  end
end
