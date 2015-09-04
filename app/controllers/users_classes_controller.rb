class UsersClassesController < ApplicationController
  def destroy
    users_classes = UsersClass.where(user_id: current_user.id, class_room_id: params[:class_room_id])
    users_classes.each do |users_class|
      users_class.destroy
    end
    redirect_to :root
  end

  private
  def id_params
    params.permit(:id)
  end
end
