class Public::RestaurantsController < Public::Base
  def index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
