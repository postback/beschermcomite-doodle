class CreateNotes < ActiveRecord::Migration[5.0]
  def self.up
    create_table :notes do |t|
      t.integer :postje_id
      t.integer :timeslot_id

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
