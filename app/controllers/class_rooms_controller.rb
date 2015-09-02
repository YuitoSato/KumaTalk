class ClassRoomsController < ApplicationController
  def new
    @class_room = ClassRoom.new
  end

  def create
    @class_room = ClassRoom.create(create_params)
  end

  def search
    @class_rooms = ClassRoom.where("key like '%#{params[:keyword]}%'").limit(20)
  end

  private
  def create_params
    params.require(:class_room).permit(:key, :detail).merge(department_id: current_user.department_id)
  end

  private
  def search_params
    params.permit(:keyword)
  end
end
