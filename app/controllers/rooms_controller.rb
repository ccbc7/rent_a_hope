class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @all_rooms = Room.all
    @user = current_user
    @rooms = @user.rooms
  end

  def new
    @user = current_user
    @room = Room.new
    @q = Room.ransack(params[:q])
  end

  def create
    @user = current_user
    @q = Room.ransack(params[:q])
    @room = Room.new(params.require(:room).permit(:room_name, :room_introduction, :charge, :adress, :room_image))

    @room.user_id = current_user.id
    if @room.valid?(:create) && @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to registered_rooms_rooms_path
    elsif
      params[:back] || !@room.save #戻るボタンを押したときまたは、@eventが保存されなかったらnewアクションを実行
      render :new and return
      redirect_to "/rooms/new"
    end
  end

  def show
    # binding.pry
    @user = current_user
    @q = Room.ransack(params[:q])
    @room = Room.find(params[:id])
  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
    @q = Room.ransack(params[:q])
    @results = @q.result

  end

  def update
    @q = Room.ransack(params[:q])
    @results = @q.result
    @user = current_user

    @room = Room.find(params[:id])

    if params[:back] || !@room.update(params.require(:room).permit(:start_day, :end_day, :people, :room_name, :adress, :charge))
          render 'edit'
    else
          redirect_to root_path
          flash[:notice] = "IDが「#{@room.id}」の情報を更新しました"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ルームを削除しました"
    redirect_to registered_rooms_rooms_path
  end


  def reservations
    @room =  Room.find(params[:id])
    @user = current_user
    @q = Room.ransack(params[:q])
    @results = @q.result
  end

  def registered_rooms
    @rooms = current_user.rooms
    @user = current_user
    @q = Room.ransack(params[:q])
    @results = @q.result
  end

  private

  def set_q
    @q = Room.ransack(params[:q])
  end

  def room_params
    params.require(:room).permit(:room_image)
  end


end
