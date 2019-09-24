class AddLeerlingKlasToVolunteer < ActiveRecord::Migration
  def self.up
    add_column :volunteers, :klas, :string
    add_column :volunteers, :leerling, :string
  end

  def self.down
    remove_column :volunteers, :leerling
    remove_column :volunteers, :klas
  end
end
