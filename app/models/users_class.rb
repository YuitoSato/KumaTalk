class UsersClass < ActiveRecord::Base
  belongs_to :user
  belongs_to :class_room
end
