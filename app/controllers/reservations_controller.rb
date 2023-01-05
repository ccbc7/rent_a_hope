class ReservationsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if params[:back] || !@reservation.save

    else
      flash[:notice] = "予約に成功しました"
      redirect_to "/"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def reserved_rooms
    @user = current_user
    @reservations =  Reservation.where(user_id: current_user.id)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to users_path
  end

  def confirm
    # binding.pry
    @user = current_user
    @reservation = Reservation.new(confirm_params)
    @room = Room.find(params[:id])
  end

  private
  def confirm_params
  params.permit(:user_id, :room_id, :room_name, :charge, :start_date, :end_date, :people, :avatar, :current_user_id, :id)#時間の計算をするために必要
  end
  def reservation_params
  params.require(:reservation).permit(:user_id, :room_id, :room_name, :charge, :start_date, :end_date, :people, :avatar)
  end
end
