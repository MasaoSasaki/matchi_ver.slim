class Public::ReservationsController < Public::Base
  def index
  end

  def show
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @reservation = Reservation.new
  end

  def confirm
  end

  def create
    reservation = Reservation.new
    reservation.user_id = current_public_user.id
    reservation.menu_id = params[:menu_id]
  end

  def completion
  end
  private
  def reservation_params
    params.require(:reservation).permit(
      :reservation_year, :reservation_month, :reservation_day,
      :reservation_time, :people
    )
  end

end
