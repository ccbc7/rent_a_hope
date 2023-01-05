class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search] #ransack用
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
    @user = current_user#ログイン中ユーザー取得
    @reservation = Reservation.new
    @room = Room.find(params[:id])
    @regist_user = User.find(@room.user_id)#ルーム登録時に紐づけた登録者のuser_idからユーザー名を検索
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

  def registered_rooms
    @user = current_user
    @rooms = @user.rooms
  end

  def search #ransack用
    @rooms = Room.all
    @user = current_user
    @results = @q.result
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :charge, :user_id, :address, :room_introduction, :avatar)
  # binding.pry
  end

  def set_q #ransack用
    @q = User.ransack(params[:q])
  end

end
