class Master::RestaurantsController < Master::Base

  before_action :exist?, only: [:show]

  def index
    @restaurants = Restaurant.all
    @menus = Menu.all
  end

end
