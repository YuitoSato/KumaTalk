class Department < ActiveRecord::Base
  has_many :users
  has_many :class_rooms
end
