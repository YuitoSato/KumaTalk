class ClassRoomsController < ApplicationController
  def new
    @class_room = ClassRoom.new
  end

  def create
    @class_room = ClassRoom.create(create_params)
    UsersClass.create(user_id: current_user.id, class_room_id: @class_room.id)
  end

  def search
    @class_rooms = current_user.department.class_rooms.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
  end

  def show
    @class_room = ClassRoom.find(id_params[:id])
    @chats = @class_room.chats.all.order('created_at DESC')
    @chat = Chat.new
  end

  def entry
    @class_room = ClassRoom.find(id_params[:id])
  end

  def register
    @class_room = ClassRoom.find(params[:id])
    UsersClass.where(user_id: current_user.id, class_room_id: @class_room.id).first_or_create
    redirect_to :action => "show", :id => @class_room.id
  end

  def edit
    @class_room = ClassRoom.find(id_params[:id])
  end

  def update
    @class_room = ClassRoom.find(id_params[:id])
    @class_room.update(update_params)
  end

  private
  def create_params
    params.require(:class_room).permit(:name, :detail).merge(department_id: current_user.department_id)
  end

  def search_params
    params.permit(:keyword)
  end

  def update_params
    params.require(:class_room).permit(:name, :detail)
  end

  def id_params
    params.permit(:id)
  end
end
