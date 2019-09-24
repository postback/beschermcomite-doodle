class CreateLocks < ActiveRecord::Migration[5.0]
  def self.up
    create_table :locks do |t|
      t.integer :postje_id
      t.integer :timeslot_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locks
  end
end
