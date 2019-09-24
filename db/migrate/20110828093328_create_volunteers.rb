class CreateVolunteers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :volunteers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :volunteers
  end
end
