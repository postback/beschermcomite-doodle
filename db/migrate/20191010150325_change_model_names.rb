class ChangeModelNames < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :postjes, :tasks
    rename_column :applications, :postje_id, :task_id
    rename_column :locks, :postje_id, :task_id
    rename_column :notes, :postje_id, :task_id
    rename_column :volunteers, :klas, :grade
    rename_column :volunteers, :leerling, :pupil
  end

  def self.down
    rename_table :tasks, :postjes
    rename_column :applications, :task_id, :postje_id
    rename_column :locks, :task_id, :postje_id
    rename_column :notes, :task_id, :postje_id
    rename_column :volunteers, :grade, :klas
    rename_column :volunteers, :pupil, :leerling
  end
end
