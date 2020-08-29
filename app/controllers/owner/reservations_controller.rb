class Owner::ReservationsController < Owner::Base

  before_action :current_restaurant?, except: [:index]

  def index
    @reservations = Reservation.all
    @menus = Menu.all
    @users = User.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    reservation = Reservation.find(params[:id])
    redirect_to owner_reservation_path(reservation)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:reservation_status)
  end
end
