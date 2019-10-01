class AddSortingToPostjes < ActiveRecord::Migration[6.0]
  def self.up
    add_column :postjes, :sorting, :integer
  end
end
