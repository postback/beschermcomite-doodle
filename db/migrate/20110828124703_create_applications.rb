class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.integer :volunteer_id
      t.integer :postje_id
      t.string :hour

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
