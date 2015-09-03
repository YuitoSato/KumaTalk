class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.integer :class_room_id
      t.string :text

      t.timestamps null: false
    end
  end
end
