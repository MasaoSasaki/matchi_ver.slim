class Owner::ReservationsController < Owner::Base
  def index
    @reservations = Reservation.all
  end

  def show
  end
end
