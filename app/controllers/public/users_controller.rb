class Public::UsersController < Public::Base
  def show
    @reservation = Reservation.where(user_id: params[:id])
    @current_user = current_public_user
  end

  def info
    @current_user = current_public_user
  end

  def edit
  end

  def profile
  end

  def withdraw
  end
end
