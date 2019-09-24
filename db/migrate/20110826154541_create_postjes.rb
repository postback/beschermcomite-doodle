class CreatePostjes < ActiveRecord::Migration
  def self.up
    create_table :postjes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :postjes
  end
end
