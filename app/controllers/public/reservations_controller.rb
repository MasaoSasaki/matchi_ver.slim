class Public::ReservationsController < Public::Base

  @@payment_method = 0

  def index
    @reservations = Reservation.where(user_id: current_public_user.id)
    @menus = Menu.all
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @@menu = Menu.find(params[:menu_id])
    @menu = Menu.find(params[:menu_id])
    @reservation = Reservation.new
  end

  def confirm
    @menu = Menu.find(params[:menu_id])
    @reservation = Reservation.new
    case params[:payment_method]
    when "credit"
      @@payment_method = 0
    when "cash"
      @@payment_method = 1
    when "bank"
      @@payment_method = 2
    end
  end

  def create
    reservation = Reservation.new(reservation_params)
    reservation.user_id = current_public_user.id
    reservation.payment_method = @@payment_method
    reservation.save
    redirect_to action: 'completion'
  end

  def completion
    @reservation = Reservation.find_by(user_id: current_public_user.id)
  end
  private
  def reservation_params
    params.require(:reservation).permit(:menu_id, :people, :payment_method)
  end

end
