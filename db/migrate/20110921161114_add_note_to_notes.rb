class AddNoteToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :note, :string
  end

  def self.down
    remove_column :notes, :note
  end
end
