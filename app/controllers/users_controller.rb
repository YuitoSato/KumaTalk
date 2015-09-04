class UsersController < ApplicationController
  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to :root
    end
#notificationでリダイレクトで飛べなかったときの処理を書こう
  end

  def edit
  end

  def update
    current_user.update(update_params)
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :avatar)
  end
end
