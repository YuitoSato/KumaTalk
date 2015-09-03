class ClassRoom < ActiveRecord::Base
  belongs_to :department
  # has_many :users, through: :departments, source: :user
  # has_and_belongs_to_many :users
  has_many :users, through: :users_classes
  has_many :chats
  #ユーザーがとっている授業を取り出したいときはjoinメソッドをつかう
  #UsersClass.joins(:class_rooms)してuser.class_rooms
  has_many :users_classes
end
