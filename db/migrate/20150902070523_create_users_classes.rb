class CreateUsersClasses < ActiveRecord::Migration
  def change
    create_table :users_classes do |t|
      t.integer :user_id
      t.integer :class_room_id
      t.timestamps null: false
    end
  end
end
