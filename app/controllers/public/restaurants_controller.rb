class Public::RestaurantsController < Public::Base

  # before_action :current_user?

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
