class Public::UsersController < Public::Base
  def show
    @reservation = Reservation.where(user_id: params[:id])
  end

  def info
  end

  def edit
  end

  def profile
  end

  def withdraw
  end
end
