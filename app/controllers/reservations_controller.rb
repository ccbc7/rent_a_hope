class ReservationsController < ApplicationController

  def index
    @user = current_user
    @q = Room.ransack(params[:q])
    @results = @q.result

  end

  def new
    # @user = current_user
    # @reservation = Reservation.new
  end

  def confirm
    # binding.pry
    @reservation = Reservation.new(confirm_params)
    @room = Room.find(params[:room_id])
    @user = current_user
  end

  def create
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    if !@reservation.save
      # binding.pry
        flash[:notice] = "予約に失敗しました"
        render home_top_path
    else
        redirect_to "/", notice: "#{@reservation.room_name}を予約しました。"
    end
  end

  def show
    @rooms = Room.all
    @user = current_user
    @q = Room.ransack(params[:q])
    @results = @q.result
  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
    @q = Room.ransack(params[:q])
    @results = @q.result
  end

  # def update
  #   @q = Room.ransack(params[:q])
  #   @results = @q.result
  #   @user = current_user
  #   @room = Room.find(params[:id])

  #   if params[:back] || !@reservation.save(params.require(:reservation).permit(:start_day, :end_day, :people, :room_name, :adress, :charge))
  #     render "edit_reservation_path"
  #   else
  #     redirect_to "reservation_path"
  #     flash[:notice] = "IDが「#{@room.id}」の情報を更新しました"
  #   end
  # end

  def destroy
  end

  private

  def confirm_params
    params.permit(:start_day, :room_introduction, :room_name, :end_day, :people, :charge, :adress, :img, :id, :room_id )
  end
  def reservation_params
    params.require(:reservation).permit(:start_day, :room_introduction, :room_name, :end_day, :people, :charge, :adress, :img, :id, :room_id )
  end

end
