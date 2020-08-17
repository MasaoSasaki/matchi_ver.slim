class Public::RestaurantsController < Public::Base

  @@location = 0

  def index
    @restaurants = Restaurant.all
    @location = 100
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def get_location
    @@location = 100
    redirect_to :back
  end

end
