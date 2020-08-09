class Owner::RestaurantsController < Owner::Base
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
  end
end
