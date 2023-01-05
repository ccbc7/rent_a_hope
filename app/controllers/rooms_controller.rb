class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @user = current_user
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @user = current_user
    @room = Room.new(room_params)
    # @user = User.find(params[:id])
    if @room.save
      flash[:notice] = "ルームを登録しました"
      redirect_to "/"
    elsif @room.save!
      binding.pry
      flash[:notice] = "ルームを登録できませんでした"
      render new_room_path
    end
  end

  def show
    @reservation = Reservation.new
    @room = Room.find(params[:id])
    @user = User.find(@room.user_id)#ルーム登録時に紐づけた登録者のuser_idからユーザー名を検索
    @current_user = User.find(params[:format])#ログイン中ユーザー取得
  end

  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ルームを削除しました"
    redirect_to rooms_path
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :charge, :user_id, :address, :room_introduction, :avatar)
  # binding.pry
  end
end
