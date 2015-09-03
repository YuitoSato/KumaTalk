class ChatsController < ApplicationController
  def create
    @chat = Chat.create(create_params)
    redirect_to :controller => 'class_rooms', :action => 'show', :id => params[:class_room_id]
  end

  private
  def create_params
    # params.permit(:text, :class_room_id).merge(user_id: current_user.id)
    required_params = params.require(:chat).permit(:text).merge(user_id: current_user.id)
    params.permit(:class_room_id).merge(required_params)
  end
end
