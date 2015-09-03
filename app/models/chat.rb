class Chat < ActiveRecord::Base
  belongs_to :user
  belongs_to :class_room
  validates_presence_of :user_id, :text, :class_room_id
end
