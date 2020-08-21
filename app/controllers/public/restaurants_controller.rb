class Public::RestaurantsController < Public::Base

  def index
    @restaurants = Restaurant.all
    @restaurants_address = Restaurant
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def get_location
    redirect_to :back
  end

end
