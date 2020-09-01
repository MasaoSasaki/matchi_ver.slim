class Public::RestaurantsController < Public::Base

  # before_action :current_user?
  before_action :exist?, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

end
