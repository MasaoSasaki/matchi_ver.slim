class Master::RestaurantsController < Master::Base
  def index
    @restaurants = Restaurant.all
    @menus = Menu.all
  end

  def show
  end
end
