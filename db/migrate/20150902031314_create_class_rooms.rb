class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |t|
      t.string :key
      t.string :detail
      t.integer :department_id
      t.timestamps null: false
    end
  end
end
