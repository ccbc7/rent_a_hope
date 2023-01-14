class UsersController < ApplicationController

  def  new
    @user = currrent_user
  end

  def show
    @user = current_user
    @q = Room.ransack(params[:q])
    @room = Room.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.update(params.require(:user).permit(:introduction,:username,:avatar))

      flash[:notice] = "IDが「#{current_user.id}」の情報を更新しました"
      redirect_to '/'
    else
      render "edit"
    end

  end


  private

  def test_params
    params.require(:user).permit(:text, :avatar)
  end


end
