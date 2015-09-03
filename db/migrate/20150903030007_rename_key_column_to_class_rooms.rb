class RenameKeyColumnToClassRooms < ActiveRecord::Migration
  def change
    rename_column :class_rooms, :key, :name
  end
end
