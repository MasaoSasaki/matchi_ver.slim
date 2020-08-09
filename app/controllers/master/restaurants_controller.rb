class Master::RestaurantsController < Master::Base
  def index
    @restaurants = Restaurant.all
    @menus = Restaurant.all
  end

  def show
  end
end
