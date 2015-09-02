class ClassRoomsController < ApplicationController
  def new
  end

  def create
    @class_room = ClassRoom.create(create_params)
  end

  private
  def create_params
    params.require(:class_room).permit(:key, :detail)
  end
end
